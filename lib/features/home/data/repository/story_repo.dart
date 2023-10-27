import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/net/api_url.dart';
import 'package:http_parser/http_parser.dart';

class StoryRepo {
  Future<Either<String, String>> uploadImage(File file) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last,
          contentType: MediaType("image", "jpeg"))
    });
    final response = await DioHelper.post(
      APIUrls.API_Upload_Image,
      formData: formData,
    );
    try {
      if (response.data['success'] == true) {
        return Right(response.data['result']['url']);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> uploadStory(String img) async {
    print("rest");
    FormData formData = FormData.fromMap({
      "description": "",
      "images": [
        {"url": img, "isVideo": false}
      ]
    });
    final response = await DioHelper.post(
      APIUrls.API_Upload_Story,
      formData: {
        "description": "",
        "images": [
          {"url": img, "isVideo": false}
        ]
      },
    );
    print("rest2");

    print(response);
    try {
      if (response.data['success'] == true) {
        print("Success uploadImage");
        return const Right(true);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
