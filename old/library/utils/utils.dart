import 'package:xsoulspace/utils/utils.dart';

Future<void> launchEmail() async {
  await launchURL(
    'mailto:anton@xsoulspace.dev?subject=hello_xsoulspace&body=Hey!',
  );
}
