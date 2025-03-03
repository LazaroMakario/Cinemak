import 'package:cinemak/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => OnboardingScreen());
    r.module('/home', module: HomeModule());
  }
}
