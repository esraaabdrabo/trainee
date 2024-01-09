import 'package:dio/dio.dart';

import '../constants/app/app_constants.dart';
import '../datasources/shared_preference.dart';
import '../net/api_url.dart';

class DioHelper {
  static Dio dioSingleton = Dio()..options.baseUrl = APIUrls.BASE_URL;

  static Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    dynamic formData,
  }) async{
    final pref = await SpUtil.getInstance();
    final token= pref.getString(AppConstants.KEY_TOKEN);

    dioSingleton.options.headers = headers;
    return dioSingleton.post(path,
        data: formData ?? body,
        options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "Authorization":
                   "Bearer $token"

            }));
  }

  static Future<Response<dynamic>> put(
    String path, {
    dynamic body,
  }) async{
    final pref = await SpUtil.getInstance();
    final token= pref.getString(AppConstants.KEY_TOKEN);

    return  dioSingleton.put(path,
        data: body,
        options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "Authorization":
                   "Bearer $token"
            }));
  }

  static Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? query}) async{
    final pref = await SpUtil.getInstance();
    final token= pref.getString(AppConstants.KEY_TOKEN);
    dioSingleton.options.headers = headers;
    return dioSingleton.get(path,
        queryParameters: query,
        options: Options(headers: {
          "Authorization":
               "Bearer $token"
        }));
  }
   static Future<Response<dynamic>> delete(String path,
      {Map<String, dynamic>? headers, Map<String, dynamic>? query}) async{
    final pref = await SpUtil.getInstance();
    final token= pref.getString(AppConstants.KEY_TOKEN);
    dioSingleton.options.headers = headers;
    return dioSingleton.delete(path,
        queryParameters: query,
        options: Options(headers: {
          "Authorization":
               "Bearer $token"
        }));
  }
}
