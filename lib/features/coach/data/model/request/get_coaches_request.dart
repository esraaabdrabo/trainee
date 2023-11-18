// ignore_for_file: prefer_null_aware_operators

import 'package:dio/dio.dart';

import '../../../../../core/params/base_params.dart';

class GetCoachesRequest extends BaseParams {
  GetCoachesRequest(
      {this.sorting,
      this.specializationId,
      this.categoryId,
      this.status,
      this.isVerified,
      this.latitude,
      this.longitude,
      this.keyword,
      this.skipCount,
      this.maxResultCount,
      this.q,
      CancelToken? cancelToken})
      : super(cancelToken: cancelToken);

  final String? sorting;
  final int? specializationId;
  final int? categoryId;
  final int? status;
  final bool? isVerified;
  final double? latitude;
  final double? longitude;
  final String? keyword;
  final int? skipCount;
  final int? maxResultCount;
  final Map<String, dynamic>? q;
  factory GetCoachesRequest.fromMap(Map<String, dynamic> json) =>
      GetCoachesRequest(
        sorting: json["sorting"],
        specializationId: json["specializationId"],
        categoryId: json["categoryId"],
        status: json["status"],
        isVerified: json["isVerified"] == null ? null : json["IsVerified"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        keyword: json["keyword"],
        skipCount: json["skipCount"],
        maxResultCount: json["maxResultCount"],
      );

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> _temp = {};

    if (sorting != null) _temp["sorting"] = sorting;
    if (specializationId != null) _temp["specializationId"] = specializationId;
    if (categoryId != null) _temp["categoryId"] = categoryId;
    if (status != null) _temp["status"] = status;
    if (isVerified != null) _temp["isVerified"] = isVerified;
    if (latitude != null) _temp["latitude"] = latitude;
    if (longitude != null) _temp["longitude"] = longitude;
    if (keyword != null) _temp["keyword"] = keyword;
    if (skipCount != null) _temp["skipCount"] = skipCount;
    if (maxResultCount != null) _temp["maxResultCount"] = maxResultCount;

    return _temp;
  }
}
