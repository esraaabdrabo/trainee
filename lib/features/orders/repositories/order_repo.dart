import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/net/api_url.dart';

class OrderRepo {
  Future<Either<String, bool>> createOrder(int userId) async {
    final response = await DioHelper.post(
      APIUrls.API_Get_Order_Create,
      body: {
        "traineeId":userId ,
        "isFromRestaurant": true,
        "items": [
          {
            "itemId": 1,
            "quantity": 3
          }

        ]
      },
    );
    try {
      if (response.data['success'] == true) {
        print("Success create order");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

}
