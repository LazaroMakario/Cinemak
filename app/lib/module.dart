import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/module.dart';
import 'splash.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void routes(r) {
    r.child('/', child: (context) => SplashPage());
    r.module('/home', module: HomeModule());
  }
}
