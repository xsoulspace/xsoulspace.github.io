import 'package:dio/dio.dart';
import 'package:xsoulspace/constants/Api.dart';
import 'package:xsoulspace/constants/RequestMethods.dart';
import 'package:xsoulspace/entities/CommonError.dart';

class FetchService {
  static Future<Response<T?>?> fetch<T>(
      {required Map<String, String> body,
      required String requestMethod,
      required String url,
      Map<String, String>? urlSearchParams}) async {
    // Headers
    Map<String, String> headers = {};

    Uri uri = Uri.https(ApiGithub.unencodedPath, url, urlSearchParams);
    // FormData formData = FormData.fromMap(body);
    Dio dio = Dio();
    Options options = Options()..headers = headers;
    var response = (() async {
      try {
        switch (requestMethod) {
          case RequestMethods.post:
            return await dio.postUri(uri, data: body, options: options)
                as Future<Response<T>>;
          case RequestMethods.getRequest:
            return await dio.getUri(uri, options: options)
                as Future<Response<T>>;
          case RequestMethods.delete:
            return await dio.deleteUri(uri, options: options)
                as Future<Response<T>>;
          case RequestMethods.patch:
            return await dio.patchUri(uri, data: body, options: options)
                as Future<Response<T>>;
        }
      } on DioError catch (e) {
        if (e.response != null) {
          if (e.response.statusCode == 500) {
            throw CommonError(message: e.response.data);
          }
          throw CommonError(
            response: e.response,
          );
        } else {
          throw CommonError(message: e.message);
        }
      }
    })();

    return response;
  }
}
