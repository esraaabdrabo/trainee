



import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/login_entity.dart';

class LoginModel extends BaseModel<LoginEntity>{
  LoginModel({
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.userId,
    this.restaurantId,
    this.shopId,
  });

  final String? accessToken;
  final String? encryptedAccessToken;
  final int? expireInSeconds;
  final int? userId;
  final int? restaurantId;
  final int? shopId;

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    accessToken: json["accessToken"] == null ? null : json["accessToken"],
    encryptedAccessToken: json["encryptedAccessToken"] == null ? null : json["encryptedAccessToken"],
    expireInSeconds: json["expireInSeconds"] == null ? null : json["expireInSeconds"],
    userId: json["userId"] == null ? null : json["userId"],
    restaurantId: json["restaurantId"] == null ? null : json["restaurantId"],
    shopId: json["shopId"] == null ? null : json["shopId"],
  );

  Map<String, dynamic> toMap() => {
    "accessToken": accessToken == null ? null : accessToken,
    "encryptedAccessToken": encryptedAccessToken == null ? null : encryptedAccessToken,
    "expireInSeconds": expireInSeconds == null ? null : expireInSeconds,
    "userId": userId == null ? null : userId,
    "restaurantId": restaurantId == null ? null : restaurantId,
    "shopId": shopId == null ? null : shopId,
  };

  @override
  LoginEntity toEntity() {
    return LoginEntity(
      accessToken: this.accessToken,
      encryptedAccessToken: this.encryptedAccessToken,
      expireInSeconds: this.expireInSeconds,
      restaurantId: this.restaurantId,
      shopId: this.shopId,
      userId: this.userId,
    );
  }
}
