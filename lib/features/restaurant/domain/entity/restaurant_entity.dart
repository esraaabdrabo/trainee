import 'package:upgrade_traine_project/features/shop/data/model/response/products_model.dart';

import '../../../../core/entities/base_entity.dart';
import '../../../../core/entities/city_entity.dart';
import '../../../../core/entities/manager_entity.dart';
import '../../../../core/entities/opening_day_entity.dart';
import '../../../../core/entities/subscription_entity.dart';

abstract class PartnerEntity {
  final String? arLogo;
  final String? enLogo;
  final String? logo;
  final String? arCover;
  final String? enCover;
  final String? cover;

  final String? arName;
  final String? enName;
  final String? name;
  final int? id;
  final String? arDescription;
  final String? enDescription;
  final String? description;

  PartnerEntity(
      {this.arCover,
      this.arDescription,
      this.arLogo,
      this.arName,
      this.cover,
      this.description,
      this.enCover,
      this.enDescription,
      this.enLogo,
      this.enName,
      this.id,
      this.logo,
      this.name});
}

class RestaurantEntity extends PartnerEntity {
  RestaurantEntity({
    this.ratingDetails,
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
    super.description,
    super.enDescription,
    super.arDescription,
    this.commercialRegisterNumber,
    this.commercialRegisterDocument,
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
  });

  final String? commercialRegisterNumber;
  final String? commercialRegisterDocument;
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
  final RatingDetails? ratingDetails;

  final DateTime? creationTime;
  final SubscriptionEntity? subscription;
  final bool? isActive;

  @override
  List<Object?> get props => [
        phoneNumber,
        id,
        name,
        creationTime,
        arName,
        isActive,
        enName,
        cover,
        latitude,
        longitude,
        arCover,
        arLogo,
        buildingNumber,
        city,
        cityId,
        commercialRegisterDocument,
        commercialRegisterNumber,
        enCover,
        enLogo,
        facebookUrl,
        instagramUrl,
        logo,
        manager,
        openingDays,
        rate,
        street,
        subscription,
        twitterUrl,
        websiteUrl,
      ];
}
