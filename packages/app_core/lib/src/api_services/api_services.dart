import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.dart';
import 'abstract/abstract.dart';
import 'api_service_initializer.dart';
import 'auth_local_service.dart';
import 'auth_service.dart';
import 'firebase/firebase.dart';
import 'local_data_service.dart';
import 'local_user_service.dart';

export 'api_service_initializer.dart';
export 'auth_local_service.dart';
export 'auth_service.dart';
export 'firebase/firebase.dart';
export 'local_data_service.dart';
export 'local_user_service.dart';

abstract class ApiService {}

class ApiServices {
  ApiServices._({
    required this.user,
    required this.projects,
    required this.authService,
    required this.localUser,
  });

  factory ApiServices.create(final BuildContext context) {
    final dio = context.read<ApiServiceInitializer>().dio;

    final ILocalDataService localDataService = SharedPreferencesDataService();
    final authLocalService = AuthLocalService(
      authLocalApi: AuthLocalApi(localDataService: localDataService),
    );
    final authService = AuthService(
      authLocalService: authLocalService,
      authApi: AuthApi(dio),
    );
    final IUserApiService userApiService = FirebaseUserApiService();
    return ApiServices._(
      user: userApiService,
      projects: FirebaseProjectsApiService(),
      localUser: LocalUserService(localDataService: localDataService),
      authService: authService,
    );
  }

  final IUserApiService user;
  final LocalUserService localUser;
  final IProjectsApiService projects;
  final AuthService authService;
}
