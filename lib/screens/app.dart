import 'package:flutter/material.dart';
import 'package:xsoulspace/screens/home.dart';

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
