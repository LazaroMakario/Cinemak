import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/di/injector.dart';
import 'package:home/presentation/details/view/details_screen.dart';
import 'package:home/presentation/home/cubit/home_cubit.dart';
import 'package:home/presentation/home/view/home_screen.dart';

class HomeModule extends Module {
  HomeModule() {
    configureHomeDependencies();
  }

  @override
  void binds(i) {
    i.addSingleton<HomeCubit>(() => getHomeIt<HomeCubit>());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) {
      final homeCubit = Modular.get<HomeCubit>()..getMovies();

      return BlocProvider(
        create: (_) => homeCubit,
        child: HomeScreen(),
      );
    });
    r.child(
      '/details',
      child: (context) => MovieDetailsScreen(
        movie: r.args.data,
      ),
    );
  }
}
