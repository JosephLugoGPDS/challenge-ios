import 'package:challenge/app/presentation/env/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static Dio _dio = Dio();
  TokenInterceptor? _tokenInterceptor;

  ApiClient() {
    final options = BaseOptions(
      baseUrl: Env.uri,
      connectTimeout: const Duration(milliseconds: 6000),
      receiveTimeout: const Duration(milliseconds: 6000),
      headers: {
        'Authorization': 'Bearer ${Env.accessToken}',
        'Content-Type': 'application/json',
      },
    );
    _dio = Dio(options)
      ..interceptors.addAll([SuccessInterceptor(), ErrorInterceptor()]);
  }

  Dio get dio => _dio;

  Future<void> setAccessToken(String accessToken) async {
    if (_tokenInterceptor != null) {
      await _tokenInterceptor!.setAccessToken(accessToken);
    }
  }
}

class TokenInterceptor extends Interceptor {
  final Dio dio;
  String? _accessToken;

  TokenInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }
    super.onRequest(options, handler);
  }

  Future<void> setAccessToken(String accessToken) async {
    _accessToken = accessToken;
  }
}

class TimestampInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Timestamp'] = DateTime.now().toIso8601String();
    super.onRequest(options, handler);
  }
}

class SuccessInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200) {
      // Do something with the response
      //TODO: add success interceptor
    }
    super.onResponse(response, handler);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('Error : ${err.response?.data}, ${err.response?.statusCode}');
    //TODO: add error interceptor
    super.onError(err, handler);
  }
}
