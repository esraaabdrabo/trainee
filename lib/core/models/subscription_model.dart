
import '../entities/subscription_entity.dart';
import 'base_model.dart';
import 'city_model.dart';

class SubscriptionModel extends BaseModel<SubscriptionEntity> {
  SubscriptionModel({
    this.subscriptionId,
    this.userId,
    this.user,
    this.creationTime,
    this.isExpired,
    this.name,
    this.fee,
    this.duration,
    this.remainingDays,
    this.remainingRequests,
    this.remainingItems,
    this.id,
  });

  final int? subscriptionId;
  final int? userId;
  final CityModel? user;
  final DateTime? creationTime;
  final bool? isExpired;
  final String? name;
  final int? fee;
  final int? duration;
  final int? remainingDays;
  final int? remainingRequests;
  final int? remainingItems;
  final int? id;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        subscriptionId:
            json["subscriptionId"] == null ? null : json["subscriptionId"],
        userId: json["userId"] == null ? null : json["userId"],
        user: json["user"] == null ? null : CityModel.fromJson(json["user"]),
        creationTime: json["creationTime"] == null
            ? null
            : DateTime.parse(json["creationTime"]),
        isExpired: json["isExpired"] == null ? null : json["isExpired"],
        name: json["name"] == null ? null : json["name"],
        fee: json["fee"] == null ? null : json["fee"],
        duration: json["duration"] == null ? null : json["duration"],
        remainingDays:
            json["remainingDays"] == null ? null : json["remainingDays"],
        remainingRequests: json["remainingRequests"] == null
            ? null
            : json["remainingRequests"],
        remainingItems:
            json["remainingItems"] == null ? null : json["remainingItems"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "subscriptionId": subscriptionId == null ? null : subscriptionId,
        "userId": userId == null ? null : userId,
        "user": user == null ? null : user!.toJson(),
        "creationTime":
            creationTime == null ? null : creationTime!.toIso8601String(),
        "isExpired": isExpired == null ? null : isExpired,
        "name": name == null ? null : name,
        "fee": fee == null ? null : fee,
        "duration": duration == null ? null : duration,
        "remainingDays": remainingDays == null ? null : remainingDays,
        "remainingRequests":
            remainingRequests == null ? null : remainingRequests,
        "remainingItems": remainingItems == null ? null : remainingItems,
        "id": id == null ? null : id,
      };

  @override
  SubscriptionEntity toEntity() {
    return SubscriptionEntity(
      id: this.id,
      name: this.name,
      userId: this.userId,
      creationTime: this.creationTime,
      duration: this.duration,
      fee: this.fee,
      isExpired: this.isExpired,
      remainingDays: this.remainingDays,
      remainingItems: this.remainingItems,
      remainingRequests: this.remainingRequests,
      subscriptionId: this.subscriptionId,
      user: this.user?.toEntity(),
    );
  }
}
