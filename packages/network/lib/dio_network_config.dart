import 'package:dio/dio.dart';
import 'package:network/network_config.dart';

class DioNetworkConfig implements NetworkConfig {
  @override
  final String baseUrl;
  @override
  final Duration connectTimeout;
  @override
  final Duration receiveTimeout;
  @override
  final List<Interceptor> interceptors;

  DioNetworkConfig({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.interceptors = const [],
  });
}
