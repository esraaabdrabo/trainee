// To parse this JSON data, do
//
//     final getStoryRequest = getStoryRequestFromMap(jsonString);

import 'package:dio/dio.dart';

import '../../../../../core/params/base_params.dart';

class GetStoryRequest extends BaseParams {
  GetStoryRequest({
    required this.id,
    CancelToken? cancelToken,
  }) : super(cancelToken: cancelToken);

  final int id;

  factory GetStoryRequest.fromMap(Map<String, dynamic> json) => GetStoryRequest(
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}
