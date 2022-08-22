import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "https://eltamiuz.net/hesaquran/";
  dio.options.connectTimeout = 20000;
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestBody: true,
      requestHeader: true,
    ),
  );
  return dio;
}
