import 'dart:io';

import 'package:dio/dio.dart';

class UpdateProfileModel {
  final String? name;
  final int? gender;
  final String? phone;
  final String? birthDate;
  final String? height;
  final String? weight;
  final String? lat;
  final String? long;
  final String? countryCode;
  final String? emailAddress;
  final String? imageUrl;
  final int? id;


  UpdateProfileModel(
      {this.name,
      this.gender,
      this.phone,
      this.birthDate,
      this.height,
      this.weight,
      this.lat,
      this.countryCode,
        this.emailAddress,
        this.imageUrl,
        this.id,
      this.long});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['length'] = height;
    data['weight'] = weight;
    data['name'] = name;
    data['phoneNumber'] = phone;
    data['latitude'] = lat;
    data['longitude'] = long;
    data['countryCode'] = countryCode;
    data["emailAddress"]=emailAddress;
    data["imageUrl"]=imageUrl;
    data["id"]=id;

    return data;
  }
}
