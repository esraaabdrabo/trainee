import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../constants/app/app_constants.dart';
import '../../datasources/shared_preference.dart';
import '../../error/server_failure.dart';
import '../../error/success.dart';

class NetworkUtlits {
  String? lang;
  String? token;

  Future<Map<String, String>> makeHeaders({required bool withToken}) async {
    final pref = await SpUtil.getInstance();
    final token = pref.getString(AppConstants.KEY_TOKEN);
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };
    if (withToken) {
      print("tokkk:$token}");

      print("tokkk:}");
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Either<ServerFailure, Success> responseHandling(Response result) {
    if (result.statusCode == 200) {
      return Right(Success(data: result.data));
    } else {
      return Left(ServerFailure.fromResponse(result.statusCode!, result));
    }
  }
}
