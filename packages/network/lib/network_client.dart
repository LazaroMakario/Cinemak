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
  }

  T create<T>(T Function(Dio) creator) {
    return creator(_dio);
  }
}
