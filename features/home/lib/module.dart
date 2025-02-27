import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/presentation/home/cubit/home_cubit.dart';
import 'package:home/presentation/home/view/home_screen.dart';
import 'package:injection/injector.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => getIt<HomeCubit>());
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
  }
}
