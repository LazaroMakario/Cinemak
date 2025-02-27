import 'package:dio/dio.dart';

abstract class NetworkConfig {
  String get baseUrl;
  Duration get connectTimeout;
  Duration get receiveTimeout;
  List<Interceptor> get interceptors;
}
