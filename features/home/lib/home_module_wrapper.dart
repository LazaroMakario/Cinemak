import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/di/injector.dart';
import 'package:home/presentation/home/cubit/home_cubit.dart';

/// Widget contenedor que proporciona un único BlocProvider para todas las pantallas del módulo Home
class HomeModuleWrapper extends StatefulWidget {
  const HomeModuleWrapper({super.key});

  @override
  State<HomeModuleWrapper> createState() => _HomeModuleWrapperState();
}

class _HomeModuleWrapperState extends State<HomeModuleWrapper> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Modular.to.navigate('./home-main');
    });
    // Redireccionamos a la ruta /home al iniciar
    //Future.microtask(() => Modular.to.navigate('/home-main'));
  }

  @override
  Widget build(BuildContext context) {
    // Usamos un BlocProvider único para todo el módulo
    return BlocProvider<HomeCubit>(
      create: (context) => getHomeIt<HomeCubit>()..getMovies(),
      // Scaffold vacío como contenedor mientras se navega
      child: Scaffold(
        body: RouterOutlet(),
      ),
      /* child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ), */
    );
  }
}
