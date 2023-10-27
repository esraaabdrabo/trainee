import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:upgrade_traine_project/core/errors/app_errors.dart';
import 'package:upgrade_traine_project/core/params/no_params.dart';
import 'package:upgrade_traine_project/features/profile/data/model/response/profile_model.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/net/api_url.dart';
import 'iprofile_remote.dart';

@Singleton(as: IProfileRemoteSource)
class ProfileRemoteSource extends IProfileRemoteSource {
  @override
  Future<Either<AppErrors, ProfileModel>> getProfile(NoParams params) {
    return request(
        converter: (json) => ProfileModel.fromJson(json),
        method: HttpMethod.GET,
        cancelToken: params.cancelToken,
        url: APIUrls.API_GET_PROFILE);
  }
}
