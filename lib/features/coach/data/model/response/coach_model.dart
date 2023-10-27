import '../../../../../core/models/base_model.dart';
import '../../../../../core/models/subscription_model.dart';
import '../../../../home/data/model/response/specialization_model.dart';
import '../../../domain/entity/coach_entity.dart';

class CoachModel extends BaseModel<CoachEntity> {
  CoachModel(
      {this.birthDate,
      this.yearsOfExperience,
      this.specializationId,
      this.specialization,
      this.age,
      this.name,
      this.cvUrl,
      this.gender,
      this.imageUrl,
      this.address,
      this.emailAddress,
      this.latitude,
      this.longitude,
      this.phoneNumber,
      this.countryCode,
      this.lastLoginDate,
      this.coursesCount,
      this.rate,
      this.status,
      this.isVerified,
      this.isActive,
      this.subscription,
      this.id,
      this.ratingDetailsModel,
      this.hourPrice});

  final DateTime? birthDate;
  final int? yearsOfExperience;
  final int? specializationId;
  final SpecializationModel? specialization;
  final int? age;
  final String? name;
  final String? cvUrl;
  final int? gender;
  final String? imageUrl;
  final String? address;
  final String? emailAddress;
  final double? latitude;
  final double? longitude;
  final String? phoneNumber;
  final String? countryCode;
  final DateTime? lastLoginDate;
  final int? coursesCount;
  final double? rate;
  final int? status;
  final bool? isVerified;
  final bool? isActive;
  final SubscriptionModel? subscription;
  final RatingDetailsModel? ratingDetailsModel;
  final int? id;
  final double? hourPrice;

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
      birthDate:
          json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
      yearsOfExperience:
          json["yearsOfExperience"],
      specializationId:
          json["specializationId"],
      specialization: json["specialization"] == null
          ? null
          : SpecializationModel.fromJson(json["specialization"]),
      ratingDetailsModel: json["ratingDetails"] == null
          ? null
          : RatingDetailsModel.fromJson(json["ratingDetails"]),
      age: json["age"],
      name: json["name"],
      cvUrl: json["cvUrl"],
      gender: json["gender"],
      imageUrl: json["imageUrl"],
      address: json["address"],
      emailAddress: json["emailAddress"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      phoneNumber: json["phoneNumber"],
      countryCode: json["countryCode"],
      lastLoginDate: json["lastLoginDate"] == null
          ? null
          : DateTime.parse(json["lastLoginDate"]),
      coursesCount: json["coursesCount"],
      rate: json["rate"],
      status: json["status"],
      isVerified: json["isVerified"],
      isActive: json["isActive"],
      subscription: json["subscription"] == null
          ? null
          : SubscriptionModel.fromJson(json["subscription"]),
      id: json["id"],
      hourPrice: json["hourPrice"]);

  Map<String, dynamic> toJson() => {
        "birthDate": birthDate == null ? null : birthDate!.toIso8601String(),
        "yearsOfExperience":
            yearsOfExperience,
        "specializationId": specializationId,
        "specialization":
            specialization == null ? null : specialization!.toJson(),
        "ratingDetails":
            ratingDetailsModel == null ? null : ratingDetailsModel!.toJson(),
        "age": age,
        "name": name,
        "cvUrl": cvUrl,
        "gender": gender,
        "imageUrl": imageUrl,
        "address": address,
        "emailAddress": emailAddress,
        "latitude": latitude,
        "longitude": longitude,
        "phoneNumber": phoneNumber,
        "countryCode": countryCode,
        "lastLoginDate":
            lastLoginDate == null ? null : lastLoginDate!.toIso8601String(),
        "coursesCount": coursesCount,
        "rate": rate,
        "status": status,
        "isVerified": isVerified,
        "isActive": isActive,
        "subscription": subscription == null ? null : subscription!.toJson(),
        "id": id,
        "hourPrice": hourPrice,
      };

  @override
  CoachEntity toEntity() {
    return CoachEntity(
        phoneNumber: this.phoneNumber,
        ratingDetails: this.ratingDetailsModel?.toEntity(),
        id: this.id,
        name: this.name,
        isActive: this.isActive,
        latitude: this.latitude,
        longitude: this.longitude,
        rate: this.rate,
        subscription: this.subscription?.toEntity(),
        imageUrl: this.imageUrl,
        countryCode: this.countryCode,
        address: this.address,
        age: this.age,
        birthDate: this.birthDate,
        coursesCount: this.coursesCount,
        cvUrl: this.cvUrl,
        emailAddress: this.emailAddress,
        gender: this.gender,
        isVerified: this.isVerified,
        lastLoginDate: this.lastLoginDate,
        specialization: this.specialization?.toEntity(),
        specializationId: this.specializationId,
        status: this.status,
        hoursPrice: this.hourPrice,
        yearsOfExperience: this.yearsOfExperience);
  }
}

class RatingDetailsModel extends BaseModel<RatingDetails> {
  final int? i1;
  final int? i2;
  final int? i3;
  final int? i4;
  final int? i5;

  RatingDetailsModel({this.i1, this.i2, this.i3, this.i4, this.i5});

  factory RatingDetailsModel.fromJson(Map<String, dynamic> json) =>
      RatingDetailsModel(
          i1: json["1"],
          i2: json["2"],
          i3: json["3"],
          i4: json["4"],
          i5: json["5"]);

  Map<String, dynamic> toJson() =>
      {"1": i1, "2": i2, "3": i3, "4": i4, "5": i5};

  @override
  RatingDetails toEntity() {
    return RatingDetails(
      i1: this.i1,
      i2: this.i2,
      i3: this.i3,
      i4: this.i4,
      i5: this.i5,
    );
  }
}
