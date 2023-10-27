import 'package:flutter/cupertino.dart';

import '../../errors/app_errors.dart';

abstract class ResponseValidator {
  AppErrors? error;
  String? errorMessage;

  void processData(dynamic data);

  bool get isValid {
    return !hasError;
  }

  bool get hasError {
    return error != null;
  }

  AppErrors get getError {
    if (error != null) {
      return error!;
    } else {
      throw FlutterError("Call [hasError] before to check there is an error");
    }
  }
}
