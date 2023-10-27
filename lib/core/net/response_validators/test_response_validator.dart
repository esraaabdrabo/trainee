
import 'package:upgrade_traine_project/core/net/response_validators/response_validator.dart';

import '../../errors/app_errors.dart';

class TestResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (data["message"].toString().contains("Fail")) {
      error = AppErrors.customError(message: data["message"]);
      errorMessage = data["message"];
    }
  }
}
