import 'package:http/http.dart' as http;
import 'package:jaspr/jaspr.dart';
import 'package:universal_io/io.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';
import 'package:yaml/yaml.dart';

class ProjectsService extends ChangeNotifier {
  // Singleton instance
  static final ProjectsService instance = ProjectsService._();

  ProjectsService._() {
    fetchProjects();
  }

  Map<ProjectId, ProjectModel> _projects = {};
  Map<ProjectId, ProjectModel> get projects => _projects;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _hasBeenFetched = false;

  Future<void> fetchProjects() async {
    if (_hasBeenFetched) return;

    try {
      String content;
      if (kIsWeb) {
        // Client-side execution: Fetch over HTTP.
        final response = await http.get(Uri.parse('/data/projects.yaml'));
        content = response.body;
      } else {
        // Server-side execution (pre-rendering): Read from file system.
        final file = File('web/data/projects.yaml');
        content = await file.readAsString();
      }

      final yamlMap = loadYaml(content);

      if (yamlMap is! YamlMap || yamlMap['projects'] is! YamlList) {
        _projects = {};
      } else {
        final projectsList = (yamlMap['projects'] as YamlList).map((
          projectData,
        ) {
          final standardMap = _convertYamlMapToMap(projectData as YamlMap);
          return ProjectModel.fromJson(standardMap);
        }).toList();
        _projects = {for (final project in projectsList) project.id: project};
      }
    } catch (e) {
      print('Error fetching projects: $e');
      _projects = {};
    } finally {
      _isLoading = false;
      _hasBeenFetched = true;
      // Only notify listeners on the client side to avoid server frame scheduling errors
      if (kIsWeb) {
        notifyListeners();
      }
    }
  }

  /// Recursively converts a YamlMap to a standard Dart Map.
  Map<String, dynamic> _convertYamlMapToMap(YamlMap yamlMap) {
    final map = <String, dynamic>{};
    for (final entry in yamlMap.entries) {
      if (entry.key is String) {
        map[entry.key as String] = _convertNode(entry.value);
      }
    }
    return map;
  }

  /// Recursively converts a YamlList to a standard Dart List.
  List<dynamic> _convertYamlListToList(YamlList yamlList) {
    return yamlList.map(_convertNode).toList();
  }

  /// Converts any YamlNode to its standard Dart equivalent.
  dynamic _convertNode(dynamic node) {
    if (node is YamlMap) {
      return _convertYamlMapToMap(node);
    } else if (node is YamlList) {
      return _convertYamlListToList(node);
    }
    return node;
  }
}
