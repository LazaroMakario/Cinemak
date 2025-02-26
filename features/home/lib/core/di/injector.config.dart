// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:home/core/di/dio_provider.dart' as _i895;
import 'package:home/core/di/internet_connection_provider.dart' as _i555;
import 'package:home/core/network/api_client.dart' as _i848;
import 'package:home/data/datasources/remote/movie_remote_data_source.dart'
    as _i202;
import 'package:home/data/datasources/remote/movie_remote_data_source_impl.dart'
    as _i695;
import 'package:home/data/repositories/movie_repository_impl.dart' as _i1012;
import 'package:home/domain/repositories/movie_repository.dart' as _i293;
import 'package:home/domain/usecases/get_most_popular_movies.dart' as _i895;
import 'package:home/domain/usecases/get_now_playing_movies.dart' as _i53;
import 'package:home/presentation/cubit/movies_cubit.dart' as _i1019;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

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
    final internetConnectionProvider = _$InternetConnectionProvider();
    final dioProvider = _$DioProvider();
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => internetConnectionProvider.internetConnectionChecker);
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dio);
    gh.singleton<_i848.MovieService>(() => _i848.MovieService(gh<_i361.Dio>()));
    gh.factory<_i202.MovieRemoteDataSource>(
        () => _i695.MovieRemoteDataSourceImpl(gh<_i848.MovieService>()));
    gh.factory<_i293.MovieRepository>(() => _i1012.MovieRepositoryImpl(
          remoteDataSource: gh<_i202.MovieRemoteDataSource>(),
          connectionChecker: gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i53.GetNowPlayingMoviesUseCase>(
        () => _i53.GetNowPlayingMoviesUseCase(gh<_i293.MovieRepository>()));
    gh.factory<_i895.GetMostPopularMoviesUseCase>(
        () => _i895.GetMostPopularMoviesUseCase(gh<_i293.MovieRepository>()));
    gh.factory<_i1019.MoviesCubit>(() => _i1019.MoviesCubit(
          gh<_i895.GetMostPopularMoviesUseCase>(),
          gh<_i53.GetNowPlayingMoviesUseCase>(),
        ));
    return this;
  }
}

class _$InternetConnectionProvider extends _i555.InternetConnectionProvider {}

class _$DioProvider extends _i895.DioProvider {}
