import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import '../error/server_failure.dart';
import '../error/success.dart';
import '../net/api_url.dart';
import '../utils/network_utilities/network_utilits.dart';

class DioHelper {
  static late Dio dio;

  DioHelper.internal() {
    initDioInstance();
  }

  static final DioHelper _instance = DioHelper.internal();

  factory DioHelper() => _instance;
  NetworkUtlits networkUtlits = NetworkUtlits();

  static initDioInstance() {
    dio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        receiveDataWhenStatusError: true,
        baseUrl:APIUrls.BASE_URL,
      ),
    );
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: false,
      request: true,
      responseBody: true,
    ));
  }

  Future<Either<ServerFailure, Success>> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = await networkUtlits.makeHeaders(withToken: true);
    try {
      final response = await dio.get(
        url,
        queryParameters: query,
      );
      print("reee");
      print("response:::$response");
      return networkUtlits.responseHandling(response);
    } catch (error) {
      if (error is DioError) {
        print("reee");
        print("response:::${error.error}");
        return Left(ServerFailure.fromDioError(error));

      }
      print("reee");
      print("response:::${error.toString()}");
      return Left(ServerFailure(errorMessage: error.toString()));
    }
  }

  Future<Either<ServerFailure, Success>> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      required bool withToken}) async {
    dio.options.headers = await networkUtlits.makeHeaders(withToken: withToken);

    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        //data: FormData.fromMap(data),
        data: data,
      );
      print("ree${response.data}");
      print("ree${response.statusCode}");
      return networkUtlits.responseHandling(response);
    } catch (error) {
      if (error is DioError) {
        print("err:${error.error.toString()}");
        return Left(ServerFailure.fromDioError(error));
      }
      print("err:${error.toString()}");
      return Left(ServerFailure(errorMessage: error.toString()));
    }
  }


  Future<Either<ServerFailure, Success>> postDataImage(
      {required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        required bool withToken}) async {
    dio.options.headers = await networkUtlits.makeHeaders(withToken: withToken);

    try {
      final response = await dio.post(
        url,
        queryParameters: query,
        data: FormData.fromMap(data),
       // data: data,
      );
      print("ree${response.data}");
      print("ree${response.statusCode}");
      return networkUtlits.responseHandling(response);
    } catch (error) {
      if (error is DioError) {
        print("err:${error.error.toString()}");
        return Left(ServerFailure.fromDioError(error));
      }
      print("err:${error.toString()}");
      return Left(ServerFailure(errorMessage: error.toString()));
    }
  }

  ///put data
  Future<Either<ServerFailure, Success>> putData(
      {required String url,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query,
        required bool withToken}) async {
    dio.options.headers = await networkUtlits.makeHeaders(withToken: withToken);

    try {
      final response = await dio.put(
        url,
        queryParameters: query,
        //data: FormData.fromMap(data),
        data: data,
      );
      print("ree${response.data}");
      print("ree${response.statusCode}");
      return networkUtlits.responseHandling(response);
    } catch (error) {
      if (error is DioError) {
        print("err:${error.error.toString()}");
        return Left(ServerFailure.fromDioError(error));
      }
      print("err:${error.toString()}");
      return Left(ServerFailure(errorMessage: error.toString()));
    }
  }

  ///Upload File
  static Future<MultipartFile> uploadFile(File file) async {
    debugPrint(file.path);
    return await MultipartFile.fromFile(file.path,
        filename: file.path.split('/').last,contentType: MediaType("image", "jpeg"));
  }
}
