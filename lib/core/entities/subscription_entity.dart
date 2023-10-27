
import 'base_entity.dart';
import 'city_entity.dart';

class SubscriptionEntity extends BaseEntity {
  SubscriptionEntity({
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
  final CityEntity? user;
  final DateTime? creationTime;
  final bool? isExpired;
  final String? name;
  final int? fee;
  final int? duration;
  final int? remainingDays;
  final int? remainingRequests;
  final int? remainingItems;
  final int? id;

  @override
  List<Object?> get props => [
        this.name,
        this.userId,
        this.user,
        this.duration,
        this.creationTime,
        this.fee,
        this.id,
        this.isExpired,
        this.remainingDays,
        this.remainingItems,
        this.remainingRequests,
        this.subscriptionId
      ];
}
