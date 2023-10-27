
import '../../../../core/entities/base_entity.dart';
import '../../../../core/entities/city_entity.dart';
import '../../../../core/entities/manager_entity.dart';
import '../../../../core/entities/opening_day_entity.dart';
import '../../../../core/entities/subscription_entity.dart';

class RestaurantEntity extends BaseEntity {
  RestaurantEntity({
    this.arLogo,
    this.enLogo,
    this.logo,
    this.arCover,
    this.enCover,
    this.cover,
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
    this.arName,
    this.enName,
    this.name,
    this.id,
    this.description,
    this.enDescription,
    this.arDescription,
  });

  final String? arLogo;
  final String? enLogo;
  final String? logo;
  final String? arCover;
  final String? enCover;
  final String? cover;
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
  List<Object?> get props => [
        this.phoneNumber,
        this.id,
        this.name,
        this.creationTime,
        this.arName,
        this.isActive,
        this.enName,
        this.cover,
        this.latitude,
        this.longitude,
        this.arCover,
        this.arLogo,
        this.buildingNumber,
        this.city,
        this.cityId,
        this.commercialRegisterDocument,
        this.commercialRegisterNumber,
        this.enCover,
        this.enLogo,
        this.facebookUrl,
        this.instagramUrl,
        this.logo,
        this.manager,
        this.openingDays,
        this.rate,
        this.street,
        this.subscription,
        this.twitterUrl,
        this.websiteUrl,
      ];
}
