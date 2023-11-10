import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../model/request/get_coaches_request.dart';
import '../model/response/coaches_model.dart';
import 'icoach_remote.dart';

@Singleton(as: ICoachRemoteSource)
class CoachRemoteSource extends ICoachRemoteSource {
  @override
  Future<Either<AppErrors, CoachesModel>> getCoaches(
      GetCoachesRequest params) async {
    print(params.toMap().toString());
    print("remote${params}");
    return request<CoachesModel>(
        converter: (json) => CoachesModel.fromJson(json),
        method: HttpMethod.GET,
        url: APIUrls.API_GET_ALL_COACHES,
        queryParameters: params.categoryId != null
            ? {"categoryId": params.categoryId}
            : null,
        //params.toMap(),
        cancelToken: params.cancelToken);
  }
}
