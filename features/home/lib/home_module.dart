// payments/lib/payments_module.dart
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/main.dart';
import 'package:injectable/injectable.dart';

part 'home_module.g.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home',
            child: (context, args) =>
                const MyHomePage()), // Ruta dentro del módulo Payments
      ];
}
