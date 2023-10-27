import 'package:dio/dio.dart';

import '../../../../../core/params/base_params.dart';

class GetStoriesRequest extends BaseParams {
  GetStoriesRequest({
    this.isActive,
    this.keyword,
    this.sorting,
    this.skipCount,
    this.maxResultCount,
    CancelToken? cancelToken,
  }) : super(cancelToken: cancelToken);

  final bool? isActive;
  final String? keyword;
  final String? sorting;
  final int? skipCount;
  final int? maxResultCount;

  factory GetStoriesRequest.fromMap(Map<String, dynamic> json) =>
      GetStoriesRequest(
        isActive: json["isActive"] == null ? null : json["isActive"],
        keyword: json["keyword"] == null ? null : json["keyword"],
        sorting: json["sorting"] == null ? null : json["sorting"],
        skipCount: json["skipCount"] == null ? null : json["skipCount"],
        maxResultCount:
            json["maxResultCount"] == null ? null : json["maxResultCount"],
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> temp = {};
    if (isActive != null) temp["isActive"] = isActive;
    if (keyword != null) temp["keyword"] = keyword;
    if (sorting != null) temp["sorting"] = sorting;
    if (skipCount != null) temp["skipCount"] = skipCount;
    if (maxResultCount != null) temp["maxResultCount"] = maxResultCount;

    return temp;
  }
}
