import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:upgrade_traine_project/core/net/response_validators/response_validator.dart';
import '../common/app_config.dart';
import '../constants/enums/http_method.dart';
import '../errors/app_errors.dart';
import '../localization/custom_localization.dart';
import '../models/base_model.dart';
import 'api_url.dart';
import 'interceptor.dart';
import 'models_factory.dart';

@lazySingleton
class HttpClient {
  late Dio _client;

  Dio get instance => _client;

  HttpClient() {
    BaseOptions _options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      sendTimeout: 10000,
      responseType: ResponseType.json,
      baseUrl: APIUrls.BASE_URL,
    );
    _client = Dio(_options);

    /// for alice inspector
    // _client.interceptors
    //     .add(getIt<AliceHttpInspector>().alice.getDioInterceptor());

    /// For logger
    if (AppConfig().appOptions.enableDioPrinting) {
      _client.interceptors.add(PrettyDioLogger());
    }

    /// For add Authentication into header
    /// [authorization] [os] [appversion] [session]
    _client.interceptors.add(AuthInterceptor());
  }

  Future<Either<AppErrors, T>> sendRequest<T extends BaseModel>({
    required HttpMethod method,
    required String url,
    required ResponseValidator responseValidator,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    String? baseUrl,
    bool isFormData = false,
  }) async {
    if (baseUrl != null) {
      _client.options.baseUrl = baseUrl;
    } else {
      _client.options.baseUrl = APIUrls.BASE_URL;
    }

    // Get the response from the server
    Response response;
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _client.get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await _client.post(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await _client.put(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await _client.delete(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }
      // Get the decoded json
      /// json response like this
      /// {"data":"our data",
      /// "succeed":true of false,
      /// "message":"message if there is error"}
      /// response.data["succeed"] return true if request
      /// succeed and false if not so if was true we don't need
      /// return this value to model we just need the data
      var model;
      responseValidator.processData(response.data);

      if (responseValidator.isValid) {
        /// Here we send the data from response to Models factory
        /// to assign data as model
        try {
          model = ModelsFactory.getInstance().createModel<T>(
              response.data['result'] != null &&
                      (response.data['result'] is Map<String, dynamic>)
                  ? response.data['result']
                  : {"": ""});
        } catch (e) {
         // e.toString().logE;
          return const Left(CustomError(message: 'unexpected error'));
        }
        return Right(model);
      } else if (responseValidator.hasError) {
        return Left(CustomError(message: responseValidator.errorMessage!));
      } else
        return Left(
          CustomError(
            message: CustomLocalization.generalErrorMessage,
          ),
        );
    }

    /// Handling errors
    on DioError catch (e) {
    //  e.toString().logE;
      return Left(_handleDioError(e));
    }

    /// Couldn't reach out the server
    on SocketException catch (_) {
     // e.toString().logE;
      return const Left(SocketError());
    }
  }

  Future<Either<AppErrors, List<T>>> sendListRequest<T extends BaseModel>({
    required HttpMethod method,
    required String url,
    required ResponseValidator responseValidator,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    CancelToken? cancelToken,
    String? baseUrl,
    bool isFormData = false,
  }) async {
    if (baseUrl != null) {
      _client.options.baseUrl = baseUrl;
    } else {
      _client.options.baseUrl = APIUrls.BASE_URL;
    }

    // Get the response from the server
    Response response;
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _client.get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.POST:
          response = await _client.post(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.PUT:
          response = await _client.put(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
        case HttpMethod.DELETE:
          response = await _client.delete(
            url,
            data: isFormData && body != null ? FormData.fromMap(body) : body,
            queryParameters: queryParameters,
            options: Options(headers: headers),
            cancelToken: cancelToken,
          );
          break;
      }
      // Get the decoded json
      /// json response like this
      /// {"data":"our data",
      /// "succeed":true of false,
      /// "message":"message if there is error"}
      /// response.data["succeed"] return true if request
      /// succeed and false if not so if was true we don't need
      /// return this value to model we just need the data
      var model;
      responseValidator.processData(response.data);

      if (responseValidator.isValid) {
        /// Here we send the data from response to Models factory
        /// to assign data as model
        try {
          model = (response.data as List)
              .map((e) => ModelsFactory.getInstance().createModel<T>(e))
              .toList();
        } catch (e) {
        //  e.toString().logE;
          return Left(CustomError(message: e.toString()));
        }
        return Right(model);
      } else if (responseValidator.hasError) {
        return Left(CustomError(message: responseValidator.errorMessage!));
      } else
       { return Left(
          CustomError(
            message: CustomLocalization.generalErrorMessage,
          ),
        );}
    }

    /// Handling errors
    on DioError catch (e) {
    //  e.toString().logE;
      return Left(_handleDioError(e));
    }

    /// Couldn't reach out the server
    on SocketException catch (e) {
    //  e.toString().logE;
      return const Left(SocketError());
    }
  }

  Future<Either<AppErrors, T>> upload<T extends BaseModel>({
    required String url,
    required String fileKey,
    required String filePath,
    required String fileName,
    required MediaType mediaType,
    required CancelToken cancelToken,
    required ResponseValidator responseValidator,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    String? baseUrl,
  }) async {
    if (baseUrl != null) {
      _client.options.baseUrl = baseUrl;
    } else {
      _client.options.baseUrl = APIUrls.BASE_URL;
    }

    Map<String, dynamic> dataMap = {};
    if (data != null) {
      dataMap.addAll(data);
    }
    dataMap.addAll({
      fileKey: await MultipartFile.fromFile(
        filePath,
        filename: fileName,
        contentType: mediaType,
      )
    });
    try {
      final response = await _client.post(
        url,
        data: FormData.fromMap(dataMap),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );

      // Get the decoded json
      /// json response like this
      /// {"data":"our data",
      /// "succeed":true of false,
      /// "message":"message if there is error"}
      /// response.data["succeed"] return true if request
      /// succeed and false if not so if was true we don't need
      /// return this value to model we just need the data
      var model;
      responseValidator.processData(response.data);

      if (responseValidator.isValid) {
        /// Here we send the data from response to Models factory
        /// to assign data as model
        try {
          model = ModelsFactory.getInstance().createModel<T>(response.data);
        } catch (e) {
      //    e.toString().logE;
          return Left(CustomError(message: e.toString()));
        }
        return Right(model);
      } else if (responseValidator.hasError) {
        return Left(CustomError(message: responseValidator.errorMessage!));
      } else
{        return const Left(UnknownError());
}    }
    // Handling errors
    on DioError catch (e) {
     // e.toString().logE;
      return Left(_handleDioError(e));
    }

    // Couldn't reach out the server
    on SocketException catch (e) {
     // e.toString().logE;
      return const Left(SocketError());
    }
  }

  AppErrors _handleDioError<E>(DioError error) {
    try {
      if (error.type == DioErrorType.other ||
          error.type == DioErrorType.response) {
        if (error.error is SocketException) return const SocketError();
        if (error.type == DioErrorType.response) {
          switch (error.response!.statusCode) {
            case 400:
              return const BadRequestError();
            case 401:
              return const UnauthorizedError();
            case 403:
              return const ForbiddenError();
            case 404:
              return NotFoundError(error.requestOptions.path);
            case 409:
              return const ConflictError();
            case 500:
              if (error.response?.data is Map) {
                if (error.response!.data?["error"] != null) {
                  return InternalServerWithDataError(
                      int.tryParse(error.response!.data?["error"]["code"]
                                  ?.toString() ??
                              "") ??
                          500,
                      message: error.response!.data?["error"]["message"]);
                }
              }
              return const InternalServerError();

            //   return ErrorMessageModel<E>.fromMap(error.response!.data);
            default:
              return const UnknownError();
          }
        }
        return const UnknownError();
      } else {
        if (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.sendTimeout ||
            error.type == DioErrorType.receiveTimeout) {
          return const TimeoutError();
        } else if (error.type == DioErrorType.cancel) {
          return CancelError(
            CustomLocalization.cancelErrorMessage,
          );
        } else
{          return const UnknownError();
}      }
    } catch (str) {
      return const UnknownError();
    }
  }
}
