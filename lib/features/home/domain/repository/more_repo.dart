import 'package:dartz/dartz.dart';
import 'package:upgrade_traine_project/core/net/api_url.dart';
import '../../../../../core/dioHelper/dio_helper.dart';

class MoreRepo {
  Future<Either<String, bool>> addFeedback(String subject, String desc) async {
    final response = await DioHelper.post(
      APIUrls.API_CREATE_REPORT,
      body: {"description": desc, "subject": subject},
    );
    try {
      if (response.data['success'] == true) {
        return const Right(true);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> deleteAccount(int id) async {
    final response =
        await DioHelper.delete(APIUrls.API_DELETE_ACCOUNT, query: {"id": id});
    try {
      if (response.data['success'] == true) {
        return const Right(true);
      } else {
        return Left(response.data['error']['details']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
