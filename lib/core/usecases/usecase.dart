import '../../../core/errors/app_errors.dart';

import '../params/base_params.dart';
import '../results/result.dart';

abstract class UseCase<Type, Params extends BaseParams> {
  Future<Result<AppErrors, Type>> call(Params params);
}
