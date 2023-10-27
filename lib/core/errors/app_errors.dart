import 'package:freezed_annotation/freezed_annotation.dart';
import 'http_error.dart';

part 'app_errors.freezed.dart';

@freezed
class AppErrors with _$AppErrors {
  @Implements<HttpError>()
  const factory AppErrors.connectionError() = ConnectionError;

  @Implements<HttpError>()
  const factory AppErrors.internalServerError() = InternalServerError;

  @Implements<HttpError>()
  const factory AppErrors.internalServerWithDataError(
    int errorCode, {
    String? message,
  }) = InternalServerWithDataError;

  const factory AppErrors.accountNotVerifiedError() = AccountNotVerifiedError;

  /// BadRequestError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.badRequestError({@Default("") String message}) =
      BadRequestError;

  /// CancelError extends BaseError
  const factory AppErrors.cancelError(String? message) = CancelError;

  /// ConflictError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.conflictError() = ConflictError;

  /// CustomError extends BaseError
  const factory AppErrors.customError({@Default("") String message}) =
      CustomError;

  /// ForbiddenError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.forbiddenError() = ForbiddenError;

  /// FormatError extends BaseError
  const factory AppErrors.formatError() = FormatError;

  /// LoginRequiredError extends BaseError
  const factory AppErrors.loginRequiredError() = LoginRequiredError;

  /// NetError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.netError() = NetError;

  /// NotFoundError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.notFoundError(String requestedUrlPath) =
      NotFoundError;

  /// ResponseError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.responseError() = ResponseError;

  /// ScreenNotImplementedError extends BaseError
  const factory AppErrors.screenNotImplementedError() =
      ScreenNotImplementedError;

  /// SocketError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.socketError() = SocketError;

  /// TimeoutError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.timeoutError() = TimeoutError;

  /// UnauthorizedError extends HttpError
  @Implements<HttpError>()
  const factory AppErrors.unauthorizedError() = UnauthorizedError;

  /// UnknownError extends ConnectionError
  @Implements<HttpError>()
  const factory AppErrors.unknownError() = UnknownError;
}
