import 'package:dio/dio.dart';
import 'package:drf_flutter_app/repository/dio/dio_client.dart';
import 'package:drf_flutter_app/repository/exception/api_error_handler.dart';
import 'package:drf_flutter_app/repository/response/api_response.dart';
import 'package:drf_flutter_app/services/sp_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sp;

  AuthRepo({
    required this.dioClient,
    required this.sp,
  });

  //Get Items from Inventory
  Future<ApiResponse> loginRepo() async {
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

  //Get Items from Inventory
  Future<ApiResponse> getUsersRepo() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));

    try {
      response = await dioClient.get(
        "/users/",
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
  
  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      await sp.setString(SpServices.userToken, token);
    } catch (e) {
      rethrow;
    }
  }
}
