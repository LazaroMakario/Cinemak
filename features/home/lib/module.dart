import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/core/di/injector.dart';
import 'package:home/presentation/cubit/movies_cubit.dart';
import 'package:home/presentation/home.dart';
import 'package:home/presentation/home_cubitt.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<HomeCubit>(() => getIt<HomeCubit>());
    i.addSingleton<MoviesCubit>(() => getIt<MoviesCubit>());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) {
      final homeCubit = Modular.get<HomeCubit>()..loadItems();
      final moviesCubit = Modular.get<MoviesCubit>()..getMovies();

      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => homeCubit,
          ),
          BlocProvider(
            create: (_) => moviesCubit,
          ),
        ],
        child: HomePage(),
      );
    });
  }

  /* @override
  void routes(r) {
    r.child('/', child: (context) {
      final homeCubit = Modular.get<HomeCubit>()..loadItems();

      return BlocProvider(
        create: (_) => homeCubit,
        child: HomePage(),
      );
    });
  } */
}
