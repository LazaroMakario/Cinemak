import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:network/dio_network_config.dart';
import 'package:network/network_client.dart';
import 'package:network/network_config.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  NetworkConfig get config => DioNetworkConfig(
        baseUrl: 'https://api.example.com',
        interceptors: [LogInterceptor()], // Ejemplo de interceptor
      );

  @lazySingleton
  NetworkClient networkClient(NetworkConfig config) => NetworkClient(config);

  @lazySingleton
  ApiService apiService(NetworkClient client) =>
      client.create((dio) => ApiService(dio));
}
