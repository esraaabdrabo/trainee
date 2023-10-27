
import 'package:upgrade_traine_project/core/net/response_validators/response_validator.dart';

import '../../errors/app_errors.dart';

class PokemonResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (data["count"] == null) {
      error =
          const AppErrors.customError(message: "Couldn't get your pokemons");
      errorMessage = "Couldn't get your pokemons";
    }
  }
}
