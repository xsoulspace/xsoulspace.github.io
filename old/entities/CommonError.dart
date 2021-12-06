import 'package:dio/dio.dart';

class CommonError<T> implements Exception {
  Response<T?>? response;
  String? message;
  bool get isMessageEmpty => message == null || message == '';
  CommonError({this.response, this.message});
}
