import 'package:cinemak/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:design_system/design_system.dart';
import 'package:injection/global_cubit.dart';

void main() {
  return runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalCubit>(
          create: (_) => GlobalCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Cinemak',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerConfig: Modular.routerConfig,
      ),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cinemak',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  } */
}
