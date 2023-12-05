import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core.dart';
import '../services/services.dart';

class ApiServiceInitializer extends ChangeNotifier {
  ApiServiceInitializer({
    required this.baseUrl,
  }) {
    dio = _initDio();
  }
  final String baseUrl;
  late final Dio dio;

  @override
  void dispose() {
    dio.close();

    super.dispose();
  }

  Dio _initDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Access-Control-Allow-Origin': '*',
        },
      ),
    );

    return dio;
  }

  void addInterceptors({
    required final UserNotifier userNotifier,
    required final ApiServices apiServices,
    required final AnalyticsService loggerNotifier,
    required final ApiVerifier apiVerifier,
  }) {
    dio.interceptors
      ..add(
        AuthInterceptor(
          apiServices: apiServices,
          userNotifier: userNotifier,
          apiVerifier: apiVerifier,
          loggerNotifier: loggerNotifier,
        ),
      )
      ..add(
        LoggerInterceptor(loggerNotifier: loggerNotifier),
      );
  }
}
