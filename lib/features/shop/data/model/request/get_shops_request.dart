import 'package:dio/dio.dart';

import '../../../../../core/params/base_params.dart';

class GetShopsRequest extends BaseParams {
  GetShopsRequest(
      {this.minRate,
      this.maxRate,
      this.cityId,
      this.isActive,
      this.sorting,
      this.latitude,
      this.longitude,
      this.keyword,
      this.skipCount,
      this.maxResultCount,
      CancelToken? cancelToken})
      : super(cancelToken: cancelToken);

  final int? minRate;
  final int? maxRate;
  final int? cityId;
  final bool? isActive;
  final String? sorting;
  final double? latitude;
  final double? longitude;
  final String? keyword;
  final int? skipCount;
  final int? maxResultCount;

  factory GetShopsRequest.fromMap(Map<String, dynamic> json) => GetShopsRequest(
        minRate: json["minRate"] == null ? null : json["minRate"],
        maxRate: json["maxRate"] == null ? null : json["maxRate"],
        cityId: json["cityId"] == null ? null : json["cityId"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        sorting: json["sorting"] == null ? null : json["sorting"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        keyword: json["keyword"] == null ? null : json["keyword"],
        skipCount: json["skipCount"] == null ? null : json["skipCount"],
        maxResultCount:
            json["maxResultCount"] == null ? null : json["maxResultCount"],
      );

  Map<String, dynamic> toMap() => {
        "minRate": minRate == null ? null : minRate,
        "maxRate": maxRate == null ? null : maxRate,
        "cityId": cityId == null ? null : cityId,
        "isActive": isActive == null ? null : isActive,
        "sorting": sorting == null ? null : sorting,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "keyword": keyword == null ? null : keyword,
        "skipCount": skipCount == null ? null : skipCount,
        "maxResultCount": maxResultCount == null ? null : maxResultCount,
      };
}
