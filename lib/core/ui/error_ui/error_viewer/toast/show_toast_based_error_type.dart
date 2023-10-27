import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../errors/app_errors.dart';
import '../error_viewer.dart';
import 'errv_toast_options.dart';

void showToastBasedErrorType(
  BuildContext context,
  AppErrors error,
  VoidCallback callback, {
  ErrVToastOptions errVToastOptions = const ErrVToastOptions(),
}) {
  error.map(
    connectionError: (error) {
      ErrorViewer.showConnectionError(
        context,
        callback,
        errorViewerOptions: errVToastOptions,
      );
    },
    internalServerError: (_) {
      ErrorViewer.showInternalServerError(
        context,
        callback,
        errorViewerOptions: errVToastOptions,
      );
    },
    internalServerWithDataError: (error) {
      if (error.message == null) {
        ErrorViewer.showUnexpectedError(
          context,
          errorViewerOptions: errVToastOptions,
          callback: callback,
        );
      } else {
        ErrorViewer.showCustomError(
          context,
          error.message!,
          errorViewerOptions: errVToastOptions,
          callback: callback,
        );
      }
    },
    accountNotVerifiedError: (_) {
      ErrorViewer.showAccountNotVerifiedError(
        context,
        callback,
        errorViewerOptions: errVToastOptions,
      );
    },
    badRequestError: (error) {
      ErrorViewer.showBadRequestError(
        context,
        error.message,
        errorViewerOptions: errVToastOptions,
        callback: callback,
      );
    },
    cancelError: (_) {
      ErrorViewer.showCancelError(
        context,
        callback,
        errorViewerOptions: errVToastOptions,
      );
    },
    conflictError: (_) {
      ErrorViewer.showConflictError(
        context,
        errorViewerOptions: errVToastOptions,
        callback: callback,
      );
    },
    customError: (error) {
      ErrorViewer.showCustomError(
        context,
        error.message,
        errorViewerOptions: errVToastOptions,
        callback: callback,
      );
    },
    forbiddenError: (_) {
      ErrorViewer.showForbiddenError(
        context,
        errorViewerOptions: errVToastOptions,
        callback: callback,
      );
    },
    formatError: (_) {
      ErrorViewer.showFormatError(
        context,
        callback,
        errorViewerOptions: errVToastOptions,
      );
    },
    loginRequiredError: (_) {
      ErrorViewer.showCustomError(
        context,
        Translation.of(context).loginErrorRequired,
        errorViewerOptions: errVToastOptions,
      );
    },
    netError: (_) {
      ErrorViewer.showConnectionError(
        context,
        callback,
      );
    },
    notFoundError: (error) {
      ErrorViewer.showNotFoundError(
        context,
        errorViewerOptions: errVToastOptions,
        callback: callback,
        url: error.requestedUrlPath,
      );
    },
    responseError: (_) {
      ErrorViewer.showCustomError(
        context,
        "An error aquire in response",
        errorViewerOptions: errVToastOptions,
      );
    },
    screenNotImplementedError: (_) {
      ErrorViewer.showCustomError(
        context,
        "screen Not ImplementedError",
        errorViewerOptions: errVToastOptions,
      );
    },
    socketError: (_) {
      ErrorViewer.showSocketError(
        context,
        callback,
        errorViewerOptions: errVToastOptions,
      );
    },
    timeoutError: (_) {
      ErrorViewer.showTimeoutError(
        context,
        errorViewerOptions: errVToastOptions,
        callback: callback,
      );
    },
    unauthorizedError: (_) {
      ErrorViewer.showUnauthorizedError(
        context,
        errorViewerOptions: errVToastOptions,
        callback: callback,
      );
    },
    unknownError: (_) {
      ErrorViewer.showUnknownError(
        context,
        errorViewerOptions: errVToastOptions,
        callback: callback,
      );
    },
  );
}
