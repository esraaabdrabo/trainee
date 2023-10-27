
import '../../../../../core/models/base_model.dart';
import '../../../../../core/models/city_model.dart';
import '../../../../../core/models/manager_model.dart';
import '../../../../../core/models/opening_day_model.dart';
import '../../../../../core/models/subscription_model.dart';
import '../../../domain/entity/restaurant_entity.dart';

class RestaurantModel extends BaseModel<RestaurantEntity> {
  RestaurantModel({
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

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        arLogo: json["arLogo"] == null ? null : json["arLogo"],
        enLogo: json["enLogo"] == null ? null : json["enLogo"],
        logo: json["logo"] == null ? null : json["logo"],
        arCover: json["arCover"] == null ? null : json["arCover"],
        enCover: json["enCover"] == null ? null : json["enCover"],
        cover: json["cover"] == null ? null : json["cover"],
        commercialRegisterNumber: json["commercialRegisterNumber"] == null
            ? null
            : json["commercialRegisterNumber"],
        commercialRegisterDocument: json["commercialRegisterDocument"] == null
            ? null
            : json["commercialRegisterDocument"],
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
        isActive: json["isActive"] == null ? null : json["isActive"],
        arName: json["arName"] == null ? null : json["arName"],
        description: json["description"] == null ? null : json["description"],
        arDescription:
            json["arDescription"] == null ? null : json["arDescription"],
        enDescription:
            json["enDescription"] == null ? null : json["enDescription"],
        enName: json["enName"] == null ? null : json["enName"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "arLogo": arLogo == null ? null : arLogo,
        "enLogo": enLogo == null ? null : enLogo,
        "logo": logo == null ? null : logo,
        "arCover": arCover == null ? null : arCover,
        "enCover": enCover == null ? null : enCover,
        "cover": cover == null ? null : cover,
        "commercialRegisterNumber":
            commercialRegisterNumber == null ? null : commercialRegisterNumber,
        "commercialRegisterDocument": commercialRegisterDocument == null
            ? null
            : commercialRegisterDocument,
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
        "isActive": isActive == null ? null : isActive,
        "arName": arName == null ? null : arName,
        "enName": enName == null ? null : enName,
        "arDescription": arDescription == null ? null : arDescription,
        "enDescription": enDescription == null ? null : enDescription,
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
      };

  @override
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      phoneNumber: this.phoneNumber,
      id: this.id,
      name: this.name,
      creationTime: this.creationTime,
      isActive: this.isActive,
      enName: this.enName,
      arName: this.arName,
      arCover: this.arCover,
      arLogo: this.arLogo,
      buildingNumber: this.buildingNumber,
      city: this.city?.toEntity(),
      cityId: this.cityId,
      commercialRegisterDocument: this.commercialRegisterDocument,
      commercialRegisterNumber: this.commercialRegisterNumber,
      cover: this.cover,
      enCover: this.enCover,
      enLogo: this.enLogo,
      facebookUrl: this.facebookUrl,
      instagramUrl: this.instagramUrl,
      latitude: this.latitude,
      logo: this.logo,
      longitude: this.longitude,
      manager: this.manager?.toEntity(),
      openingDays: this.openingDays?.map((e) => e.toEntity()).toList(),
      rate: this.rate,
      street: this.street,
      subscription: this.subscription?.toEntity(),
      twitterUrl: this.twitterUrl,
      websiteUrl: this.websiteUrl,
      description: this.description,
      arDescription: this.arDescription,
      enDescription: this.enDescription,
    );
  }
}
