import 'package:logger/logger.dart';

import '../../../di/service_locator.dart';

/// Extension on [String] to make printing beautiful debugging prints easier
extension LoggerExtension on String {
 // void get logE => getIt<Logger>().e(this);

  void get logW => getIt<Logger>().w(this);

  void get logI => getIt<Logger>().i(this);

  void get logD => getIt<Logger>().d(this);
}
