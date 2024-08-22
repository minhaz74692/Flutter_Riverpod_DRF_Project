import 'package:dio/dio.dart';
import 'package:drf_flutter_app/constants.dart';
import 'package:drf_flutter_app/repository/dio/dio_client.dart';
import 'package:drf_flutter_app/repository/exception/api_error_handler.dart';
import 'package:drf_flutter_app/repository/response/api_response.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  //Get Items from Inventory
  static Future<ApiResponse> loginRepo() async {
    DioClient dioClient = DioClient();
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      response = await dioClient.post(
        "/log-in/",
        data: {"email": "admin1@gmail.com", "password": "123456"},
      );

      debugPrint(
          "API Response is: ${ApiResponse.withSuccess(response).response.data}");
      return ApiResponse.withSuccess(response);
    } catch (error) {
      debugPrint('Error : ${ApiErrorHandler.getMessage(error)}');
      if (error is DioException) {
        if (error.response != null) {
          debugPrint("DioException: ${error.response!.data['errors']}");
        } else {
          debugPrint("DioException without response: $error");
        }
      } else {
        debugPrint("Error: ${ApiErrorHandler.getMessage(error)}");
      }

      return ApiResponse.withError(ApiErrorHandler.getMessage(error), response);
    }
  }
}
