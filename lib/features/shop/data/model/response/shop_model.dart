import 'package:upgrade_traine_project/features/coach/data/model/response/coach_model.dart';

import '../../../../../core/models/base_model.dart';
import '../../../../../core/models/city_model.dart';
import '../../../../../core/models/manager_model.dart';
import '../../../../../core/models/opening_day_model.dart';
import '../../../../../core/models/subscription_model.dart';
import '../../../domain/entity/shop_entity.dart';

class ShopModel extends BaseModel<ShopEntity> {
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
        arLogo: json["arLogo"] == null ? null : json["arLogo"],
        enLogo: json["enLogo"] == null ? null : json["enLogo"],
        logo: json["logo"] == null ? null : json["logo"],
        arCover: json["arCover"] == null ? null : json["arCover"],
        enCover: json["enCover"] == null ? null : json["enCover"],
        cover: json["cover"] == null ? null : json["cover"],
        cityId: json["cityId"] == null ? null : json["cityId"],
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        street: json["street"] == null ? null : json["street"],
        buildingNumber:
            json["buildingNumber"] == null ? null : json["buildingNumber"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        manager: json["manager"] == null
            ? null
            : ManagerModel.fromJson(json["manager"]),
        facebookUrl: json["facebookUrl"] == null ? null : json["facebookUrl"],
        instagramUrl:
            json["instagramUrl"] == null ? null : json["instagramUrl"],
        twitterUrl: json["twitterUrl"] == null ? null : json["twitterUrl"],
        websiteUrl: json["websiteUrl"] == null ? null : json["websiteUrl"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        openingDays: json["openingDays"] == null
            ? null
            : List<OpeningDayModel>.from(
                json["openingDays"].map((x) => OpeningDayModel.fromJson(x))),
        rate: json["rate"] == null ? null : json["rate"],
        creationTime: json["creationTime"] == null
            ? null
            : DateTime.parse(json["creationTime"]),
        subscription: json["subscription"] == null
            ? null
            : SubscriptionModel.fromJson(json["subscription"]),
        ratingDetailsModel: json["ratingDetails"] == null
            ? null
            : RatingDetailsModel.fromJson(json["ratingDetails"]),
        isActive: json["isActive"] == null ? null : json["isActive"],
        arName: json["arName"] == null ? null : json["arName"],
        enName: json["enName"] == null ? null : json["enName"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        arDescription:
            json["arDescription"] == null ? null : json["arDescription"],
        enDescription:
            json["enDescription"] == null ? null : json["enDescription"],
      );

  Map<String, dynamic> toJson() => {
        "arLogo": arLogo == null ? null : arLogo,
        "enLogo": enLogo == null ? null : enLogo,
        "logo": logo == null ? null : logo,
        "arCover": arCover == null ? null : arCover,
        "enCover": enCover == null ? null : enCover,
        "cover": cover == null ? null : cover,
        "cityId": cityId == null ? null : cityId,
        "city": city == null ? null : city!.toJson(),
        "street": street == null ? null : street,
        "buildingNumber": buildingNumber == null ? null : buildingNumber,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "manager": manager == null ? null : manager!.toJson(),
        "facebookUrl": facebookUrl == null ? null : facebookUrl,
        "instagramUrl": instagramUrl == null ? null : instagramUrl,
        "twitterUrl": twitterUrl == null ? null : twitterUrl,
        "websiteUrl": websiteUrl == null ? null : websiteUrl,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "openingDays": openingDays == null
            ? null
            : List<dynamic>.from(openingDays!.map((x) => x.toJson())),
        "rate": rate == null ? null : rate,
        "creationTime":
            creationTime == null ? null : creationTime!.toIso8601String(),
        "subscription": subscription == null ? null : subscription!.toJson(),
    "ratingDetails": ratingDetailsModel == null ? null : ratingDetailsModel!.toJson(),
        "isActive": isActive == null ? null : isActive,
        "arName": arName == null ? null : arName,
        "enName": enName == null ? null : enName,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "arDescription": arDescription == null ? null : arDescription,
        "enDescription": enDescription == null ? null : enDescription,
        "description": description == null ? null : description,
      };

  @override
  ShopEntity toEntity() {
    return ShopEntity(
        websiteUrl: this.websiteUrl,
        twitterUrl: this.twitterUrl,
        subscription: this.subscription?.toEntity(),
        street: this.street,
        rate: this.rate,
        openingDays: this.openingDays?.map((e) => e.toEntity()).toList(),
        manager: this.manager?.toEntity(),
        longitude: this.longitude,
        logo: this.logo,
        latitude: this.latitude,
        instagramUrl: this.instagramUrl,
        facebookUrl: this.facebookUrl,
        enLogo: this.enLogo,
        enCover: this.enCover,
        cover: this.cover,
        cityId: this.cityId,
        city: this.city?.toEntity(),
        buildingNumber: this.buildingNumber,
        arLogo: this.arLogo,
        arCover: this.arCover,
        arName: this.arName,
        enName: this.enName,
        isActive: this.isActive,
        creationTime: this.creationTime,
        name: this.name,
        id: this.id,
        phoneNumber: this.phoneNumber,
        enDescription: this.enDescription,
        arDescription: this.arDescription,
        ratingDetails: this.ratingDetailsModel?.toEntity(),
        description: this.description);
  }
}
