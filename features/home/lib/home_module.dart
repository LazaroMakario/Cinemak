import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/di/injector.dart';
import 'package:home/home_module_wrapper.dart';
import 'package:home/presentation/details/view/details_screen.dart';
import 'package:home/presentation/home/cubit/home_cubit.dart';
import 'package:home/presentation/home/view/home_screen.dart';

class HomeModule extends Module {
  HomeModule() {
    configureHomeDependencies();
  }

  /* @override
  void binds(i) {
    i.addSingleton<HomeCubit>(() => getHomeIt<HomeCubit>());
  } */

  @override
  void routes(r) {
    // Usamos el HomeModuleWrapper como contenedor principal para todas las rutas
    r.child('/', child: (context) => const HomeModuleWrapper(), children: [
      // Definimos las rutas internas usando ChildRoute
      ChildRoute('/home-main', child: (context) => const HomeScreen()),
      ChildRoute('/details',
          child: (context) => MovieDetailsScreen(
                movie: r.args.data,
              )),
    ]);
  }
}
