import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';
import 'package:yaml/yaml.dart';

class ProjectsService {
  Future<List<ProjectModel>> fetchProjects() async {
    try {
      String content;
      if (kIsWeb) {
        // Client-side execution: Fetch over HTTP.
        final response = await http.get(Uri.parse('data/projects.yaml'));
        content = response.body;
      } else {
        // Server-side execution (pre-rendering): Read from file system.
        final file = File('data/projects.yaml');
        content = await file.readAsString();
      }

      final yamlMap = loadYaml(content);

      if (yamlMap is! YamlMap || yamlMap['projects'] is! YamlList) {
        return [];
      }

      final projectsList = (yamlMap['projects'] as YamlList).map((projectData) {
        // The yaml parser might produce a YamlMap, which needs to be converted
        // to a standard Map<String, dynamic> for our model's fromJson factory.
        final standardMap = _convertYamlMapToMap(projectData);
        return ProjectModel.fromJson(standardMap);
      }).toList();

      return projectsList;
    } catch (e) {
      // If the file doesn't exist or there's a parsing error, return empty.
      // In a real app, you might want to log this error.
      print('Error fetching projects: $e');
      return [];
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
