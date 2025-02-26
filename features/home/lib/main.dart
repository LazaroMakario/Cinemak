import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/module.dart';

void main() {
  return runApp(ModularApp(
    module: HomeModule(),
    child: const AppWidget(),
  ));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Home App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
