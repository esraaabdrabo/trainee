import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/profile_entity.dart';
import '../datasource/../../domain/repository/iprofile_repository.dart';
import '../datasource/iprofile_remote.dart';
import '../model/response/profile_model.dart';

@Singleton(as: IProfileRepository)
class ProfileRepository extends IProfileRepository {
  final IProfileRemoteSource iProfileRemoteSource;

  ProfileRepository(this.iProfileRemoteSource);

  @override
  Future<Result<AppErrors, ProfileEntity>> getProfile(NoParams params) async {
    debugPrint("para:${params.cancelToken}");
    final remote = await iProfileRemoteSource.getProfile(params);
    debugPrint("repoImpl");
    return execute<ProfileModel, ProfileEntity>(remoteResult: remote);
  }
}
