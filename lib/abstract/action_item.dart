part of abstract;

class ActionItem {
  ActionItem({
    required final this.title,
    required final this.onTap,
  });
  final String title;
  final VoidCallback onTap;
}
