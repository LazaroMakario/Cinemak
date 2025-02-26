import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioProvider {
  @lazySingleton
  Dio get dio {
    final dio = Dio();

    // A exaple of adding headers
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer YOUR_TOKEN_HERE',
    };
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  }
}
