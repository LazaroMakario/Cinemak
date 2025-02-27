import 'package:dio/dio.dart';
import 'package:network/dio_network_config.dart';
import 'package:network/network_client.dart';

class NetworkClientBuilder {
  String _baseUrl = '';
  Duration _connectTimeout = const Duration(seconds: 30);
  Duration _receiveTimeout = const Duration(seconds: 30);
  final List<Interceptor> _interceptors = [];

  NetworkClientBuilder setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  NetworkClientBuilder setConnectTimeout(Duration timeout) {
    _connectTimeout = timeout;
    return this;
  }

  NetworkClientBuilder setReceiveTimeout(Duration timeout) {
    _receiveTimeout = timeout;
    return this;
  }

  NetworkClientBuilder addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
    return this;
  }

  NetworkClient build() {
    final config = DioNetworkConfig(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      interceptors: _interceptors,
    );
    return NetworkClient(config);
  }
}
