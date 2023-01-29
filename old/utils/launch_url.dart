part of utils;

Future<void> launchURL(final String? url) async {
  final link = url ?? '';
  if (link.isNotEmpty && await canLaunch(link)) {
    await launch(link);
  } else {
    log('Could not launch $link');
  }
}
