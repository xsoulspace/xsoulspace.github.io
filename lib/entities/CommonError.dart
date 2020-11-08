import 'package:dio/dio.dart';

class CommonError implements Exception {
  Response<dynamic> response;
  String message;
  bool get isMessageEmpty => message == null || message == '';
  CommonError({this.response, this.message});
}
