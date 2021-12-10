import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio
      // initialize dio of data type Dio
      = Dio(BaseOptions(
    baseUrl: 'https://newsapi.org/',
  ));
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'ar',
        }));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? Authorization,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': Authorization,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
