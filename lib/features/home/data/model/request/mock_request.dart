import 'package:dio/dio.dart';
import 'dart:convert';

import '../../../../../core/params/base_params.dart';


class MockRequest extends BaseParams {
  MockRequest({
    required this.token,
    required this.data,
    CancelToken? cancelToken,
  }) : super(cancelToken: cancelToken);

  final String token;
  final dynamic data;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "token": token,
        "data": data.toMap(),
      };
}

class MockRequestData {
  MockRequestData({
    required this.message,
    required this.succeed,
  });

  final String message;
  final bool succeed;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "message": message,
        "succeed": succeed,
      };
}
