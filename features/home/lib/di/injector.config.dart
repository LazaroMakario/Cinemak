// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:home/data/datasources/remote/api/api_service.dart' as _i31;
import 'package:home/data/datasources/remote/movie_remote_data_source.dart'
    as _i202;
import 'package:home/data/datasources/remote/movie_remote_data_source_impl.dart'
    as _i695;
import 'package:home/data/repositories/movie_repository_impl.dart' as _i1012;
import 'package:home/di/connection_provider.dart' as _i328;
import 'package:home/di/network_module.dart' as _i857;
import 'package:home/domain/repositories/movie_repository.dart' as _i293;
import 'package:home/domain/usecases/get_most_popular_movies.dart' as _i895;
import 'package:home/domain/usecases/get_now_playing_movies.dart' as _i53;
import 'package:home/presentation/home/cubit/home_cubit.dart' as _i634;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:network/network_client.dart' as _i371;
import 'package:network/network_config.dart' as _i847;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final internetConnectionProvider = _$InternetConnectionProvider();
    gh.lazySingleton<_i847.NetworkConfig>(() => networkModule.config);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => internetConnectionProvider.internetConnectionChecker);
    gh.lazySingleton<_i371.NetworkClient>(
        () => networkModule.networkClient(gh<_i847.NetworkConfig>()));
    gh.lazySingleton<_i31.ApiService>(
        () => networkModule.apiService(gh<_i371.NetworkClient>()));
    gh.factory<_i202.MovieRemoteDataSource>(
        () => _i695.MovieRemoteDataSourceImpl(gh<_i31.ApiService>()));
    gh.factory<_i293.MovieRepository>(() => _i1012.MovieRepositoryImpl(
          remoteDataSource: gh<_i202.MovieRemoteDataSource>(),
          connectionChecker: gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i53.GetNowPlayingMoviesUseCase>(
        () => _i53.GetNowPlayingMoviesUseCase(gh<_i293.MovieRepository>()));
    gh.factory<_i895.GetMostPopularMoviesUseCase>(
        () => _i895.GetMostPopularMoviesUseCase(gh<_i293.MovieRepository>()));
    gh.factory<_i634.HomeCubit>(() => _i634.HomeCubit(
          gh<_i895.GetMostPopularMoviesUseCase>(),
          gh<_i53.GetNowPlayingMoviesUseCase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i857.NetworkModule {}

class _$InternetConnectionProvider extends _i328.InternetConnectionProvider {}
