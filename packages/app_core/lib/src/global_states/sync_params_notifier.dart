import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_hooks/life_hooks.dart';

import '../api_services/api_services.dart';

class ProjectsNotifier extends ChangeNotifier implements Loadable, Disposable {
  ProjectsNotifier({
    required this.apiServices,
  });
  factory ProjectsNotifier.create(final BuildContext context) {
    return ProjectsNotifier(apiServices: context.read());
  }
  final ApiServices apiServices;

  @override
  Future<void> onLoad() async {}
}
