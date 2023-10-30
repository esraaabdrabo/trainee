import 'package:upgrade_traine_project/features/coach/data/model/response/coach_model.dart';

import '../../../../../core/models/base_model.dart';
import '../../../../../core/models/city_model.dart';
import '../../../../../core/models/manager_model.dart';
import '../../../../../core/models/opening_day_model.dart';
import '../../../../../core/models/subscription_model.dart';
import '../../../domain/entity/shop_entity.dart';

class ShopModel {
  ShopModel(
      {this.arLogo,
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
      this.arDescription,
      this.enDescription,
      this.description,
      this.ratingDetailsModel});

  final String? arLogo;
  final RatingDetailsModel? ratingDetailsModel;
  final String? enLogo;
  final String? logo;
  final String? arCover;
  final String? enCover;
  final String? cover;
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

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        arLogo: json["arLogo"],
        enLogo: json["enLogo"],
        logo: json["logo"],
        arCover: json["arCover"],
        enCover: json["enCover"],
        cover: json["cover"],
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
        ratingDetailsModel: json["ratingDetails"] == null
            ? null
            : RatingDetailsModel.fromJson(json["ratingDetails"]),
        isActive: json["isActive"],
        arName: json["arName"],
        enName: json["enName"],
        name: json["name"],
        id: json["id"],
        description: json["description"],
        arDescription: json["arDescription"],
        enDescription: json["enDescription"],
      );

  Map<String, dynamic> toJson() => {
        "arLogo": arLogo,
        "enLogo": enLogo,
        "logo": logo,
        "arCover": arCover,
        "enCover": enCover,
        "cover": cover,
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
        "ratingDetails":
            ratingDetailsModel == null ? null : ratingDetailsModel!.toJson(),
        "isActive": isActive,
        "arName": arName,
        "enName": enName,
        "name": name,
        "id": id,
        "arDescription": arDescription,
        "enDescription": enDescription,
        "description": description,
      };

  @override
  ShopEntity toEntity() {
    return ShopEntity(
        websiteUrl: websiteUrl,
        twitterUrl: twitterUrl,
        subscription: subscription?.toEntity(),
        street: street,
        rate: rate,
        openingDays: openingDays?.map((e) => e.toEntity()).toList(),
        manager: manager?.toEntity(),
        longitude: longitude,
        logo: logo,
        latitude: latitude,
        instagramUrl: instagramUrl,
        facebookUrl: facebookUrl,
        enLogo: enLogo,
        enCover: enCover,
        cover: cover,
        cityId: cityId,
        city: city?.toEntity(),
        buildingNumber: buildingNumber,
        arLogo: arLogo,
        arCover: arCover,
        arName: arName,
        enName: enName,
        isActive: isActive,
        creationTime: creationTime,
        name: name,
        id: id,
        phoneNumber: phoneNumber,
        enDescription: enDescription,
        arDescription: arDescription,
        ratingDetails: ratingDetailsModel?.toEntity(),
        description: description);
  }
}
