import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../common/app_config.dart';
import '../constants/app/app_constants.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await AppConfig().hasToken) {
      final token = await AppConfig().authToken;
      final os = AppConfig().os;
      final appVersion = AppConfig().appVersion;
      if (os != null) options.headers[AppConstants.HEADER_OS] = '$os';
      if (appVersion != null) {
        options.headers[AppConstants.HEADER_APP_VERSION] = '$appVersion';
      }
      if (os != null) {
        options.headers[AppConstants.HEADER_AUTH] = 'Bearer $token';
      }
      if (appVersion != null) {
        options.headers[AppConstants.HEADER_APP_VERSION] = '$appVersion';
      }
      if (os != null) {
        options.headers[AppConstants.HEADER_AUTH] = 'Bearer $token';
      }
      // options.headers[AppConstants.HEADER_AUTH] = '$apiKey';
      options.headers[AppConstants.HEADER_AUTH] = 'Bearer $token';
      options.headers[AppConstants.HEADER_LANGUAGE] = Intl.getCurrentLocale();
    }

    return super.onRequest(options, handler);
  }
}
