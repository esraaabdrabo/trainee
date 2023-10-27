import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

/// Registering Logger as a Singleton
@module
abstract class FacebookLoginModule {
  @lazySingleton
  Logger get facebookLogin => Logger();
}
