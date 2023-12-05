import 'package:xsoulspace/common_imports.dart';
import 'package:xsoulspace/other/md_screen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({
    required this.id,
    super.key,
  });
  final ProjectModelId id;
  @override
  Widget build(final BuildContext context) => ProjectPreloader(
        id: id,
        builder: (final project) => MdScreen(
          markdownUrlSource: project.markdownPrivacyPolicy,
        ),
      );
}
