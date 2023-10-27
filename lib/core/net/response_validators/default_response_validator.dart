
import 'package:upgrade_traine_project/core/net/response_validators/response_validator.dart';

import '../../errors/app_errors.dart';

class DefaultResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (!(data["success"] ?? false)) {
      error = AppErrors.customError(message: data["message"]);
      errorMessage = data["message"];
    }
  }
}
