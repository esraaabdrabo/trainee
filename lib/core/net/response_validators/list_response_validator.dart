
import 'package:upgrade_traine_project/core/net/response_validators/response_validator.dart';

import '../../errors/app_errors.dart';
import '../../localization/custom_localization.dart';

class ListResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (!(data is List)) {
      error =
          AppErrors.customError(message: CustomLocalization.notValidResponse);
      errorMessage = CustomLocalization.notValidResponse;
    }
  }
}
