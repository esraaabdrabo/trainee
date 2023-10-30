import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';
import 'package:upgrade_traine_project/features/restaurant/domain/entity/restaurant_entity.dart';

import '../../../../core/entities/base_entity.dart';
import '../../../../core/entities/city_entity.dart';
import '../../../../core/entities/manager_entity.dart';
import '../../../../core/entities/opening_day_entity.dart';
import '../../../../core/entities/subscription_entity.dart';

class ShopEntity extends PartnerEntity {
  ShopEntity({
    super.arLogo,
    super.enLogo,
    super.logo,
    super.arCover,
    super.enCover,
    super.cover,
    super.arName,
    super.enName,
    super.name,
    super.id,
    super.enDescription,
    super.arDescription,
    super.description,
    this.cityId,
    this.city,
    this.street,
    this.buildingNumber,
    this.phoneNumber,
    this.manager,
    this.facebookUrl,
    this.instagramUrl,
    this.twitterUrl,
    this.websiteUrl,
    this.latitude,
    this.longitude,
    this.openingDays,
    this.rate,
    this.creationTime,
    this.subscription,
    this.isActive,
    this.ratingDetails,
  });
  final RatingDetails? ratingDetails;
  final int? cityId;
  final CityEntity? city;
  final String? street;
  final String? buildingNumber;
  final String? phoneNumber;
  final ManagerEntity? manager;
  final String? facebookUrl;
  final String? instagramUrl;
  final String? twitterUrl;
  final String? websiteUrl;
  final double? latitude;
  final double? longitude;
  final List<OpeningDayEntity>? openingDays;
  final double? rate;
  final DateTime? creationTime;
  final SubscriptionEntity? subscription;
  final bool? isActive;

  @override
  List<Object?> get props => [];
}
