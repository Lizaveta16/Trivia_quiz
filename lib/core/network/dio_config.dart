import 'package:dio/dio.dart';
import 'package:html_unescape/html_unescape.dart';

part 'interceptors/response_interceptor.dart';

class DioConfig {
  final String baseUrl;
  static const Duration timeout = Duration(seconds: 10);

  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioConfig({required this.baseUrl}) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = timeout
      ..options.connectTimeout = timeout
      ..interceptors.addAll(<Interceptor>[
        ResponseInterceptor(_dio),
      ]);
  }
}
