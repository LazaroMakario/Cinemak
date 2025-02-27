// interceptors/header_interceptor.dart
import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZWE3NTlhOTcyNzVjNmY2Yzc3MmQxMWI5NmZiZDc2YSIsIm5iZiI6MTU3NjE3NDk1Ny42NTI5OTk5LCJzdWIiOiI1ZGYyODU2ZDJjZGU5ODAwMTYyZmRhNmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Ep68QGFXvrGc2TcQEzfK47qB5RXetP7miXJEuDn8uvQ',
    });
    super.onRequest(options, handler);
  }
}
