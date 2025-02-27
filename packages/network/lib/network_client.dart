import 'package:dio/dio.dart';
import 'package:network/network_config.dart';

class NetworkClient {
  late Dio _dio;

  NetworkClient(NetworkConfig config) {
    _dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
      ),
    );
    for (var interceptor in config.interceptors) {
      _dio.interceptors.add(interceptor);
    }
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZWE3NTlhOTcyNzVjNmY2Yzc3MmQxMWI5NmZiZDc2YSIsIm5iZiI6MTU3NjE3NDk1Ny42NTI5OTk5LCJzdWIiOiI1ZGYyODU2ZDJjZGU5ODAwMTYyZmRhNmQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Ep68QGFXvrGc2TcQEzfK47qB5RXetP7miXJEuDn8uvQ',
    };
  }

  T create<T>(T Function(Dio) creator) {
    return creator(_dio);
  }
}
