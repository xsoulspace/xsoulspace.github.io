import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/constants/CustomColors.dart';
import 'package:xsoulspace/constants/ProjectStatuses.dart';
import 'package:xsoulspace/constants/ProjectTypes.dart';
import 'package:xsoulspace/models/ProjectStatusesModel.dart';
import 'package:xsoulspace/models/ProjectsModel.dart';
import 'package:xsoulspace/screens/HomeScreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        var model = ProjectsModel(
            selectedProjectStatus: ProjectStatuses.released,
            selectedProjectType: ProjectTypes.application);
        return model;
      }),
      ChangeNotifierProvider(create: (context) => ProjectStatusesModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Soul Space',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.blue,
          scaffoldBackgroundColor: CustomColors.background,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(color: CustomColors.background),
          backgroundColor: CustomColors.background),
      home: HomeScreen(),
    );
  }
}
