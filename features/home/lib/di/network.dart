import 'package:home/di/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:network/dio_network_config.dart';
import 'package:network/network_client.dart';
import 'package:network/network_config.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  NetworkConfig get config => DioNetworkConfig(
        baseUrl: 'https://api.themoviedb.org/3/',
        interceptors: [LogInterceptor()],
      );

  @lazySingleton
  NetworkClient networkClient(NetworkConfig config) => NetworkClient(config);

  @lazySingleton
  ApiService apiService(NetworkClient client) =>
      client.create((dio) => ApiService(dio));
}
