import 'package:xsoulspace/bootstrap.dart';
import 'package:xsoulspace/common_imports.dart';
import 'package:xsoulspace/firebase_options.dart';

Future<void> main() async =>
    bootstrap(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
