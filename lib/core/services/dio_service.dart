import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:restaurant_tour/core/services/dotenv_service.dart';
import 'package:restaurant_tour/design_system/design_system.dart';

late Dio dio;

class DioService {
  static final BaseOptions dioOptions = BaseOptions(
    baseUrl: DotenvService.apiUrl,
  );

  static init({
    required String apiKey,
    required GlobalKey<ScaffoldMessengerState> snackbarKey,
  }) {
    dio = Dio(dioOptions);

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $apiKey';
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            showSnackBar(
              snackbarKey: snackbarKey,
              message: 'Invalid credentials',
            );
          }

          return handler.next(error);
        },
      ),
    );
  }

  static showSnackBar({
    required GlobalKey<ScaffoldMessengerState> snackbarKey,
    required String message,
  }) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.error,
      content: Text(
        message,
        style: const TextStyle(
          color: DsColors.white,
        ),
      ),
    );
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
