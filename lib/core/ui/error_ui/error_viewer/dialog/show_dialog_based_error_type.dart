import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../errors/app_errors.dart';
import '../error_viewer.dart';
import 'errv_dialog_options.dart';

void showDialogBasedErrorType(
  BuildContext context,
  AppErrors error,
  VoidCallback callback, {
  ErrVDialogOptions errVDialogOptions = const ErrVDialogOptions(),
}) {
  error.map(
    connectionError: (_) {
      ErrorViewer.showConnectionError(
        context,
        callback,
        errorViewerOptions: errVDialogOptions,
      );
    },
    internalServerError: (_) {
      ErrorViewer.showInternalServerError(
        context,
        callback,
        errorViewerOptions: errVDialogOptions,
      );
    },
    internalServerWithDataError: (error) {
      if (error.message == null) {
        ErrorViewer.showUnexpectedError(
          context,
          errorViewerOptions: errVDialogOptions,
          callback: callback,
        );
      } else {
        ErrorViewer.showCustomError(
          context,
          error.message!,
          errorViewerOptions: errVDialogOptions,
          callback: callback,
        );
      }
    },
    accountNotVerifiedError: (_) {
      ErrorViewer.showAccountNotVerifiedError(
        context,
        callback,
        errorViewerOptions: errVDialogOptions,
      );
    },
    badRequestError: (error) {
      ErrorViewer.showBadRequestError(
        context,
        error.message,
        errorViewerOptions: errVDialogOptions,
        callback: callback,
      );
    },
    cancelError: (_) {
      ErrorViewer.showCancelError(
        context,
        callback,
        errorViewerOptions: errVDialogOptions,
      );
    },
    conflictError: (_) {
      ErrorViewer.showConflictError(
        context,
        errorViewerOptions: errVDialogOptions,
        callback: callback,
      );
    },
    customError: (error) {
      ErrorViewer.showCustomError(
        context,
        error.message,
        errorViewerOptions: errVDialogOptions,
        callback: callback,
      );
    },
    forbiddenError: (_) {
      ErrorViewer.showForbiddenError(
        context,
        errorViewerOptions: errVDialogOptions,
        callback: callback,
      );
    },
    formatError: (_) {
      ErrorViewer.showFormatError(
        context,
        callback,
        errorViewerOptions: errVDialogOptions,
      );
    },
    loginRequiredError: (_) {
      ErrorViewer.showCustomError(
        context,
        Translation.of(context).loginErrorRequired,
        errorViewerOptions: errVDialogOptions,
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
        errorViewerOptions: errVDialogOptions,
        callback: callback,
        url: error.requestedUrlPath,
      );
    },
    responseError: (_) {
      ErrorViewer.showCustomError(
        context,
        "An error aquire in response",
        errorViewerOptions: errVDialogOptions,
      );
    },
    screenNotImplementedError: (_) {
      ErrorViewer.showCustomError(
        context,
        "Screen Not ImplementedError",
        errorViewerOptions: errVDialogOptions,
      );
    },
    socketError: (_) {
      ErrorViewer.showSocketError(
        context,
        callback,
        errorViewerOptions: errVDialogOptions,
      );
    },
    timeoutError: (_) {
      ErrorViewer.showTimeoutError(
        context,
        errorViewerOptions: errVDialogOptions,
        callback: callback,
      );
    },
    unauthorizedError: (_) {
      ErrorViewer.showUnauthorizedError(
        context,
        errorViewerOptions: errVDialogOptions,
        callback: callback,
      );
    },
    unknownError: (_) {
      ErrorViewer.showUnknownError(
        context,
        errorViewerOptions: errVDialogOptions,
        callback: callback,
      );
    },
  );
}
