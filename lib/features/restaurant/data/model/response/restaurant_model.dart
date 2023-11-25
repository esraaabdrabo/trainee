import 'package:upgrade_traine_project/features/shop/data/model/response/products_model.dart';

import '../../../../../core/models/city_model.dart';
import '../../../../../core/models/manager_model.dart';
import '../../../../../core/models/opening_day_model.dart';
import '../../../../../core/models/subscription_model.dart';
import '../../../domain/entity/restaurant_entity.dart';

class RestaurantModel {
  RestaurantModel({
    this.ratingDetailsModel,
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
    this.arDescription,
    this.enDescription,
    this.description,
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
  final CityModel? city;
  final String? street;
  final String? buildingNumber;
  final String? phoneNumber;
  final ManagerModel? manager;
  final String? facebookUrl;
  final String? instagramUrl;
  final String? twitterUrl;
  final String? websiteUrl;
  final double? latitude;
  final double? longitude;
  final List<OpeningDayModel>? openingDays;
  final double? rate;
  final DateTime? creationTime;
  final SubscriptionModel? subscription;
  final bool? isActive;
  final String? arName;
  final String? enName;
  final String? name;
  final int? id;
  final String? arDescription;
  final String? enDescription;
  final String? description;
  final RatingDetails? ratingDetailsModel;
  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        ratingDetailsModel: json["ratingDetails"] == null
            ? null
            : RatingDetails.fromJson(json["ratingDetails"]),
        arLogo: json["arLogo"],
        enLogo: json["enLogo"],
        logo: json["logo"],
        arCover: json["arCover"],
        enCover: json["enCover"],
        cover: json["cover"],
        commercialRegisterNumber: json["commercialRegisterNumber"],
        commercialRegisterDocument: json["commercialRegisterDocument"],
        cityId: json["cityId"],
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        street: json["street"],
        buildingNumber: json["buildingNumber"],
        phoneNumber: json["phoneNumber"],
        manager: json["manager"] == null
            ? null
            : ManagerModel.fromJson(json["manager"]),
        facebookUrl: json["facebookUrl"],
        instagramUrl: json["instagramUrl"],
        twitterUrl: json["twitterUrl"],
        websiteUrl: json["websiteUrl"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        openingDays: json["openingDays"] == null
            ? null
            : List<OpeningDayModel>.from(
                json["openingDays"].map((x) => OpeningDayModel.fromJson(x))),
        rate: json["rate"],
        creationTime: json["creationTime"] == null
            ? null
            : DateTime.parse(json["creationTime"]),
        subscription: json["subscription"] == null
            ? null
            : SubscriptionModel.fromJson(json["subscription"]),
        isActive: json["isActive"],
        arName: json["arName"],
        description: json["description"],
        arDescription: json["arDescription"],
        enDescription: json["enDescription"],
        enName: json["enName"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "arLogo": arLogo,
        "enLogo": enLogo,
        "logo": logo,
        "arCover": arCover,
        "enCover": enCover,
        "cover": cover,
        "commercialRegisterNumber": commercialRegisterNumber,
        "commercialRegisterDocument": commercialRegisterDocument,
        "cityId": cityId,
        "city": city == null ? null : city!.toJson(),
        "street": street,
        "buildingNumber": buildingNumber,
        "phoneNumber": phoneNumber,
        "manager": manager == null ? null : manager!.toJson(),
        "facebookUrl": facebookUrl,
        "instagramUrl": instagramUrl,
        "twitterUrl": twitterUrl,
        "websiteUrl": websiteUrl,
        "latitude": latitude,
        "longitude": longitude,
        "openingDays": openingDays == null
            ? null
            : List<dynamic>.from(openingDays!.map((x) => x.toJson())),
        "rate": rate,
        "creationTime":
            creationTime == null ? null : creationTime!.toIso8601String(),
        "subscription": subscription == null ? null : subscription!.toJson(),
        "isActive": isActive,
        "arName": arName,
        "enName": enName,
        "arDescription": arDescription,
        "enDescription": enDescription,
        "description": description,
        "name": name,
        "id": id,
      };

  @override
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      ratingDetails: ratingDetailsModel,
      phoneNumber: phoneNumber,
      id: id,
      name: name,
      creationTime: creationTime,
      isActive: isActive,
      enName: enName,
      arName: arName,
      arCover: arCover,
      arLogo: arLogo,
      buildingNumber: buildingNumber,
      city: city?.toEntity(),
      cityId: cityId,
      commercialRegisterDocument: commercialRegisterDocument,
      commercialRegisterNumber: commercialRegisterNumber,
      cover: cover,
      enCover: enCover,
      enLogo: enLogo,
      facebookUrl: facebookUrl,
      instagramUrl: instagramUrl,
      latitude: latitude,
      logo: logo,
      longitude: longitude,
      manager: manager?.toEntity(),
      openingDays: openingDays?.map((e) => e.toEntity()).toList(),
      rate: rate,
      street: street,
      subscription: subscription?.toEntity(),
      twitterUrl: twitterUrl,
      websiteUrl: websiteUrl,
      description: description,
      arDescription: arDescription,
      enDescription: enDescription,
    );
  }
}
