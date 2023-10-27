import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final getIt = GetIt.instance;
@injectableInit
Future<void> configureInjection() => $initGetIt(getIt);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
