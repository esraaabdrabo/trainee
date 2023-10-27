import 'package:dio/dio.dart';

import 'base_params.dart';

class NoParams extends BaseParams {
  NoParams({CancelToken? cancelToken}) : super(cancelToken: cancelToken);

  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}
