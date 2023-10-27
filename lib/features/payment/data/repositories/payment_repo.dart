import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/net/api_url.dart';

class PaymentRepo {
  Future<Either<String, bool>> createPayment(int userId, num amount) async {
    final response = await DioHelper.post(
      APIUrls.API_Get_Payment_Create,
      body: {
        "amount": amount.toInt(),
        "fee": 10,
        "currency": "SAR",
        "metadata": {"orderId": 1, "bookingRequestId": 0},
        "userId": userId,
      },
    );
    try {
      if (response.data['success'] == true) {
        print("Success createPayment");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }


}
