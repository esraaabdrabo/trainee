import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../di/service_locator.dart';
import '../errors/app_errors.dart';
import '../models/base_model.dart';
import '../net/models_factory.dart';
import '../net/net.dart';
import '../net/response_validators/default_response_validator.dart';
import '../net/response_validators/list_response_validator.dart';
import '../net/response_validators/response_validator.dart';

class RemoteDataSource {
  Future<Either<AppErrors, T>> requestUploadFile<T extends BaseModel>({
    required T Function(dynamic json) converter,
    required String url,
    required String fileKey,
    required String filePath,
    required MediaType mediaType,
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool withAuthentication = false,
    bool withTenants = false,
    required CancelToken cancelToken,
    ResponseValidator? responseValidator,
    Map<String, String>? headers,
    String? baseUrl,
  }) async {
    // Register the response.
    ModelsFactory.getInstance().registerModel(
      T.toString(),
      converter,
    );

    /// Send the request.
    final response = await getIt<HttpClient>().upload<T>(
      url: url,
      fileKey: fileKey,
      filePath: filePath,
      fileName: filePath.substring(filePath.lastIndexOf('/') + 1),
      mediaType: mediaType,
      data: data!,
      headers: headers,
      onSendProgress: onSendProgress!,
      cancelToken: cancelToken,
      responseValidator: responseValidator ?? DefaultResponseValidator(),
      baseUrl: baseUrl,
    );

    /// convert jsonResponse to model and return it
    if (response.isLeft()) {
      return Left((response as Left<AppErrors, T>).value);
    } else if (response.isRight()) {
      try {
        final resValue = (response as Right<AppErrors, T>).value;
        return Right(resValue);
      } catch (e) {
        //e.toString().logE;
        return const Left(
            CustomError(message: "Catch error in remote data source"));
      }
    } else {
      return const Left(UnknownError());
    }
  }

  Future<Either<AppErrors, T>> request<T extends BaseModel>({
    required T Function(dynamic json) converter,
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    bool withAuthentication = false,
    CancelToken? cancelToken,
    ResponseValidator? responseValidator,
    Map<String, String>? headers,
    String? baseUrl,
    bool isFormData = false,
  }) async {
    try {
      // Register the response.
      ModelsFactory.getInstance().registerModel(
        T.toString(),
        converter,
      );

      /// Send the request.
      final response = await getIt<HttpClient>().sendRequest<T>(
        method: method,
        url: url,
        headers: headers,
        queryParameters: queryParameters ?? {},
        body: body,
        cancelToken: cancelToken,
        responseValidator: responseValidator ?? DefaultResponseValidator(),
        baseUrl: baseUrl,
      );

      /// convert jsonResponse to model and return it
      if (response.isLeft()) {
        return Left((response as Left<AppErrors, T>).value);
      } else if (response.isRight()) {
        try {
          final resValue = (response as Right<AppErrors, T>).value;
          return Right(resValue);
        } catch (e) {
          //  e.toString().logE;
          return const Left(
              CustomError(message: "Catch error in remote data source"));
        }
      } else {
        return const Left(UnknownError());
      }
    } catch (str) {
      return const Left(UnknownError());
    }
  }

  Future<Either<AppErrors, T>> httpRequest<T extends BaseModel>({
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    bool withAuthentication = false,
    CancelToken? cancelToken,
    ResponseValidator? responseValidator,
    Map<String, String>? headers,
    String? baseUrl,
    bool isFormData = false,
  }) async {
    try {
      // // Register the response.
      // ModelsFactory.getInstance().registerModel(
      //   T.toString(),
      //   converter,
      // );
      print("tookk:${cancelToken}");

      /// Send the request.
      final response = await getIt<HttpClient>().sendRequest<T>(
        method: method,
        url: url,
        headers: headers,
        queryParameters: queryParameters ?? {},
        body: body,
        cancelToken: cancelToken,
        responseValidator: responseValidator ?? DefaultResponseValidator(),
        baseUrl: baseUrl,
      );

      /// convert jsonResponse to model and return it
      if (response.isLeft()) {
        return Left((response as Left<AppErrors, T>).value);
      } else if (response.isRight()) {
        try {
          final resValue = (response as Right<AppErrors, T>).value;
          return Right(resValue);
        } catch (e) {
          //  e.toString().logE;
          return const Left(
              CustomError(message: "Catch error in remote data source"));
        }
      } else {
        return const Left(UnknownError());
      }
    } catch (str) {
      return const Left(UnknownError());
    }
  }

  Future<Either<AppErrors, List<T>>> listRequest<T extends BaseModel>({
    required T Function(dynamic json) converter,
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    bool withAuthentication = false,
    CancelToken? cancelToken,
    ResponseValidator? responseValidator,
    Map<String, String>? headers,
    String? baseUrl,
  }) async {
    // Register the response.
    ModelsFactory.getInstance().registerModel(
      T.toString(),
      converter,
    );

    /// Send the request.
    final response = await getIt<HttpClient>().sendListRequest<T>(
      method: method,
      url: url,
      headers: headers,
      queryParameters: queryParameters ?? {},
      body: body,
      cancelToken: cancelToken,
      responseValidator: responseValidator ?? ListResponseValidator(),
      baseUrl: baseUrl,
    );

    /// convert jsonResponse to model and return it
    if (response.isLeft()) {
      return Left((response as Left<AppErrors, List<T>>).value);
    } else if (response.isRight()) {
      try {
        final resValue = (response as Right<AppErrors, List<T>>).value;
        return Right(resValue);
      } catch (e) {
        //  e.toString().logE;
        print(e.toString());
        return const Left(
            CustomError(message: "Catch error in remote data source"));
      }
    } else {
      return const Left(UnknownError());
    }
  }
}
