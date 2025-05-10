part of '../dio_config.dart';

class ResponseInterceptor extends Interceptor {
  final Dio dio;
  final HtmlUnescape unescape = HtmlUnescape();

  ResponseInterceptor(this.dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data is String) {
      response.data = unescape.convert(response.data);
    } else if (response.data is Map || response.data is List) {
      response.data = _decodeHtmlInJson(response.data);
    }

    handler.next(response);
  }

  dynamic _decodeHtmlInJson(dynamic data) {
    if (data is Map) {
      return Map<String, dynamic>.fromEntries(
        data.entries.map(
          (entry) => MapEntry(
            entry.key.toString(),
            _decodeHtmlInJson(entry.value),
          ),
        ),
      );
    } else if (data is List) {
      return data.map(_decodeHtmlInJson).toList();
    } else if (data is String) {
      return unescape.convert(data);
    } else {
      return data;
    }
  }
}
