import 'package:cinemak/presentation/onboarding/onboarding.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void routes(r) {
    r.child('/', child: (context) => OnboardingScreen());
    r.module('/home', module: HomeModule());
  }
}
