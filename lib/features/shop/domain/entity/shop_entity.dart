
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';

import '../../../../core/entities/base_entity.dart';
import '../../../../core/entities/city_entity.dart';
import '../../../../core/entities/manager_entity.dart';
import '../../../../core/entities/opening_day_entity.dart';
import '../../../../core/entities/subscription_entity.dart';

class ShopEntity extends BaseEntity {
  ShopEntity({
    this.arLogo,
    this.enLogo,
    this.logo,
    this.arCover,
    this.enCover,
    this.cover,
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
    this.arName,
    this.enName,
    this.name,
    this.id,
    this.enDescription,
    this.arDescription,
    this.description,
    this.ratingDetails,
  });
  final RatingDetails? ratingDetails;
  final String? arLogo;
  final String? enLogo;
  final String? logo;
  final String? arCover;
  final String? enCover;
  final String? cover;
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
  final String? arName;
  final String? enName;
  final String? name;
  final int? id;
  final String? arDescription;
  final String? enDescription;
  final String? description;

  @override
  List<Object?> get props => [];
}
