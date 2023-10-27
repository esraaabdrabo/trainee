class ProfileModel {
  Result? result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  ProfileModel(
      {this.result,
        this.targetUrl,
        this.success,
        this.error,
        this.unAuthorizedRequest,
        this.bAbp});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  String? birthDate;
  int? age;
  String? name;
  int? gender;
  String? imageUrl;
  String? phoneNumber;
  String? countryCode;
  String? length;
  String? weight;
  String? bmi;
  String? lastLoginDate;
  int? appliedCoursesCount;
  int? status;
  bool? isVerified;
  bool? isActive;
  String? details;
  double? latitude;
  double? longitude;
  int? id;

  Result(
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
        this.appliedCoursesCount,
        this.status,
        this.isVerified,
        this.isActive,
        this.details,
        this.latitude,
        this.longitude,
        this.id});

  Result.fromJson(Map<String, dynamic> json) {
    birthDate = json['birthDate'];
    age = json['age'];
    name = json['name'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
    length = json['length'].toString();
    weight = json['weight'].toString();
    bmi = json['bmi'].toString();
    lastLoginDate = json['lastLoginDate'];
    appliedCoursesCount = json['appliedCoursesCount'];
    status = json['status'];
    isVerified = json['isVerified'];
    isActive = json['isActive'];
    // if (json['appliedCourses'] != null) {
    //   appliedCourses = <Null>[];
    //   json['appliedCourses'].forEach((v) {
    //   //  appliedCourses!.add(new Null.fromJson(v));
    //   });
    // }
    // neighbourhood = json['neighbourhood'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthDate'] = this.birthDate;
    data['age'] = this.age;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['imageUrl'] = this.imageUrl;
    data['phoneNumber'] = this.phoneNumber;
    data['countryCode'] = this.countryCode;
    data['length'] = this.length;
    data['weight'] = this.weight;
    data['bmi'] = this.bmi;
    data['lastLoginDate'] = this.lastLoginDate;
    data['appliedCoursesCount'] = this.appliedCoursesCount;
    data['status'] = this.status;
    data['isVerified'] = this.isVerified;
    data['isActive'] = this.isActive;
   //  if (this.appliedCourses != null) {
   //  //  data['appliedCourses'] =
   // //       this.appliedCourses!.map((v) => v.toJson()).toList();
   //  }
   //  data['neighbourhood'] = this.neighbourhood;
    data['details'] = this.details;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['id'] = this.id;
    return data;
  }
}
