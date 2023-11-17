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
      this.q,
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
  final Map<String, dynamic>? q;

  factory GetShopsRequest.fromMap(Map<String, dynamic> json) => GetShopsRequest(
        minRate: json["minRate"],
        maxRate: json["maxRate"],
        cityId: json["cityId"],
        isActive: json["isActive"],
        sorting: json["sorting"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        keyword: json["keyword"],
        skipCount: json["skipCount"],
        maxResultCount: json["maxResultCount"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "minRate": minRate,
        "maxRate": maxRate,
        "cityId": cityId,
        "isActive": isActive,
        "sorting": sorting,
        "latitude": latitude,
        "longitude": longitude,
        "keyword": keyword,
        "skipCount": skipCount,
        "maxResultCount": maxResultCount,
      };
}
