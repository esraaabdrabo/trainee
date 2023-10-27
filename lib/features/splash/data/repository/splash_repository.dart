import 'package:injectable/injectable.dart';
import '../datasource/../../domain/repository/isplash_repository.dart';
import '../datasource/isplash_remote.dart';

@Singleton(as: ISplashRepository)
class SplashRepository extends ISplashRepository {
  final ISplashRemoteSource iSplashRemoteSource;

  SplashRepository(this.iSplashRemoteSource);
  
}
