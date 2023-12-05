import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:xsoulspace/common_imports.dart';

class ProjectPreloader extends StatefulWidget {
  const ProjectPreloader({
    required this.id,
    required this.builder,
    super.key,
  });
  final ProjectModelId id;
  final Widget Function(ProjectModel project) builder;

  @override
  State<ProjectPreloader> createState() => _ProjectPreloaderState();
}

class _ProjectPreloaderState extends State<ProjectPreloader> {
  @override
  void initState() {
    super.initState();
    unawaited(onLoad());
  }

  bool _loading = true;

  ProjectModel? project;
  Future<void> onLoad() async {
    project =
        await context.read<ApiServices>().projects.getByProjectId(widget.id);
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(final BuildContext context) {
    final project = this.project;
    if (_loading) return const CircularProgressIndicator.adaptive();
    if (project == null) return const Text('Project not found');
    return widget.builder(project);
  }
}

class MdScreen extends StatefulWidget {
  const MdScreen({
    required this.markdownUrlSource,
    super.key,
  });
  final String markdownUrlSource;

  @override
  State<MdScreen> createState() => _MdScreenState();
}

class _MdScreenState extends State<MdScreen> {
  bool _loading = true;
  String _markdownString = '';
  @override
  void initState() {
    super.initState();
    unawaited(_onLoad());
  }

  Future<void> _onLoad() async {
    _markdownString = await GithubFetch.fetchRaw(url: widget.markdownUrlSource);

    setState(() => _loading = false);
  }

  @override
  Widget build(final BuildContext context) => _loading
      ? const CircularProgressIndicator.adaptive()
      : Markdown(data: _markdownString);
}

class GithubFetch {
  GithubFetch._();
  static Future<String> fetchRaw({
    required final String url,
  }) async {
    final response = await http.get(Uri.parse(url));
    return response.body;
  }
}
