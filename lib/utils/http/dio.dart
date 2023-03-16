import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tomato/utils/http/error.dart';

class DioClient {
  late Dio _dio;

  static final DioClient _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://127.0.0.1:8080',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );

    _dio = Dio(options);

    // 添加请求拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // 在请求前可以对请求进行修改
          return handler.next(options);
        },
      ),
    );

    // 添加响应拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // 在响应后可以对响应进行修改
          return handler.next(response);
        },
      ),
    );

    // 添加错误拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler) {
          // 在发生错误时可以对错误进行处理
          return handler.next(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      dioError(e);
    } catch (e) {
      // 其他未知异常
      showAlertDialog('未知异常：$e');
    }
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      dioError(e);
    } catch (e) {
      // 其他未知异常
      showAlertDialog('未知异常：$e');
    }
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
      );
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      dioError(e);
    } catch (e) {
      // 其他未知异常
      showAlertDialog('未知异常：$e');
    }
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
      );
      return jsonDecode(response.toString());
    } on DioError catch (e) {
      dioError(e);
    } catch (e) {
      // 其他未知异常
      showAlertDialog('未知异常：$e');
    }
  }
}
