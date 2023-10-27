
import '../../../../core/entities/base_entity.dart';

class LoginEntity extends BaseEntity{
  LoginEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.userId,
    this.restaurantId,
    this.shopId,
  ];
}
