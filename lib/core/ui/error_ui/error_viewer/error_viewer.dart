import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../errors/app_errors.dart';
import 'dialog/errv_dialog_options.dart';
import 'dialog/show_dialog_based_error_type.dart';
import 'dialog/show_error_dialog.dart';
import 'errv_options.dart';
import 'snack_bar/errv_snack_bar_options.dart';
import 'snack_bar/show_error_snackbar.dart';
import 'snack_bar/show_snackbar_based_error_type.dart';
import 'toast/errv_toast_options.dart';
import 'toast/show_error_toast.dart';
import 'toast/show_toast_based_error_type.dart';

class ErrorViewer {
  static showError({
    required BuildContext context,
    required AppErrors error,
    required VoidCallback callback,
    ErrorViewerOptions errorViewerOptions = const ErrVToastOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showSnakBarBasedErrorType(
        context,
        error,
        callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showToastBasedErrorType(
        context,
        error,
        callback,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showDialogBasedErrorType(
        context,
        error,
        callback,
        errVDialogOptions: errorViewerOptions,
      );
    }
  }

  static void showCancelError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: Translation.of(context).cancelErrorMessage,
        context: context,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).cancelErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).cancelErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showAccountNotVerifiedError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: Translation.of(context).accountNotVerifiedErrorMessage,
        context: context,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).accountNotVerifiedErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).accountNotVerifiedErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showInternalServerError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: Translation.of(context).internalServerErrorMessage,
        context: context,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).internalServerErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).internalServerErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showFormatError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: Translation.of(context).generalErrorMessage,
        context: context,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).generalErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).generalErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showConnectionError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVDialogOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: Translation.of(context).connectionErrorMessage,
        context: context,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).connectionErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).connectionErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showCustomError(
    BuildContext context,
    String message, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        context: context,
        message: message,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: message,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: message,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showUnexpectedError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        context: context,
        callback: callback,
        message: Translation.of(context).generalErrorMessage,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).generalErrorMessage,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).generalErrorMessage,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showUnauthorizedError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        context: context,
        message: Translation.of(context).unauthorized,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).unauthorized,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).unauthorized,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }

    // TODO: Logout
    // logout();
  }

  static void showBadRequestError(
    BuildContext context,
    String? message, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: message ?? Translation.of(context).badRequest,
        context: context,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: message ?? Translation.of(context).badRequest,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: message ?? Translation.of(context).badRequest,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showForbiddenError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        context: context,
        message: Translation.of(context).forbidden,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).forbidden,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).forbidden,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }

    // TODO: Logout
    // logout();
  }

  static void showNotFoundError(
    BuildContext context, {
    @required url,
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        context: context,
        message: Translation.of(context).notFound(url),
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).notFound(url),
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).notFound(url),
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showConflictError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        context: context,
        message: Translation.of(context).conflictError,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).conflictError,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).conflictError,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showTimeoutError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        context: context,
        message: Translation.of(context).connectionTimeOut,
        callback: callback,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).connectionTimeOut,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).connectionTimeOut,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showUnknownError(
    BuildContext context, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
    VoidCallback? callback,
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions) {
      showErrorSnackBar(
        message: Translation.of(context).unknownError,
        callback: callback,
        context: context,
        errVSnackBarOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVToastOptions) {
      showErrorToast(
        message: Translation.of(context).unknownError,
        errVToastOptions: errorViewerOptions,
      );
    } else if (errorViewerOptions is ErrVDialogOptions) {
      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).unknownError,
        callback: callback,
        errVDialogOptions: errorViewerOptions,
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }

  static void showSocketError(
    BuildContext context,
    VoidCallback callback, {
    ErrorViewerOptions errorViewerOptions = const ErrVSnackBarOptions(),
  }) {
    if (errorViewerOptions is ErrVSnackBarOptions ||
        errorViewerOptions is ErrVToastOptions ||
        errorViewerOptions is ErrVDialogOptions) {
      ErrVDialogOptions? errVDialogOptions = null;

      if (errorViewerOptions is ErrVDialogOptions) {
        errVDialogOptions = errorViewerOptions;
      }

      showCustomErrorDialog(
        context: context,
        message: Translation.of(context).connectionErrorMessage,
        callback: callback,
        errVDialogOptions: errVDialogOptions ?? const ErrVDialogOptions(),
      );
    } else {
      throw Exception("Error viewer options must be defined");
    }
  }
}
