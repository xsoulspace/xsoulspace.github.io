part of abstract;

class ActionItem {
  ActionItem({
    required final this.title,
    required final this.onTap,
    final this.color,
  });
  final String title;
  final Color? color;
  final VoidCallback onTap;
}
