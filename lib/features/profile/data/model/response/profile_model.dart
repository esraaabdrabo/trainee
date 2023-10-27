import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/profile_entity.dart';

class ProfileModel extends BaseModel<ProfileEntity> {
  String? birthDate;
  int? age;
  String? name;
  String? gender;
  String? imageUrl;
  String? phoneNumber;
  String? countryCode;
  int? length;
  int? weight;
  int? bmi;
  String? lastLoginDate;

  bool? isVerified;
  bool? isActive;
  List<Null>? appliedCourses;
  Null? neighbourhood;
  String? details;
  double? latitude;
  double? longitude;
  int? id;

  ProfileModel(
      {this.birthDate,
      this.age,
      this.name,
      this.gender,
      this.imageUrl,
      this.phoneNumber,
      this.countryCode,
      this.length,
      this.weight,
      this.bmi,
      this.lastLoginDate,

      this.isVerified,
      this.isActive,
      this.appliedCourses,
      this.neighbourhood,
      this.details,
      this.latitude,
      this.longitude,
      this.id});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    birthDate = json['birthDate'];
    age = json['age'];
    name = json['name'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
    length = json['length'];
    weight = json['weight'];
    bmi = json['bmi'];
    lastLoginDate = json['lastLoginDate'];
    // appliedCoursesCount = json['appliedCoursesCount'];
    // status = json['status'];
    isVerified = json['isVerified'];
    isActive = json['isActive'];
    if (json['appliedCourses'] != null) {
      appliedCourses = <Null>[];
      json['appliedCourses'].forEach((v) {
        // appliedCourses!.add(new Null.fromJson(v));
      });
    }
    neighbourhood = json['neighbourhood'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birthDate'] = birthDate;
    data['age'] = age;
    data['name'] = name;
    data['gender'] = gender;
    data['imageUrl'] = imageUrl;
    data['phoneNumber'] = phoneNumber;
    data['countryCode'] = countryCode;
    data['length'] = length;
    data['weight'] = weight;
    data['bmi'] = bmi;
    data['lastLoginDate'] = lastLoginDate;
    // data['appliedCoursesCount'] = this.appliedCoursesCount;
    // data['status'] = this.status;
    data['isVerified'] = isVerified;
    data['isActive'] = isActive;
    if (appliedCourses != null) {
      // data['appliedCourses'] =
      //     this.appliedCourses!.map((v) => v.toJson()).toList();
    }
    data['neighbourhood'] = neighbourhood;
    data['details'] = details;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['id'] = id;
    return data;
  }

  @override
  ProfileEntity toEntity() {
    return ProfileEntity(
      details: details,
      phoneNumber: phoneNumber,
      name: name,
      age: age,
      appliedCourses: appliedCourses,
      birthDate: birthDate,
      bmi: bmi,
      imageUrl: imageUrl,
    );
  }
}
