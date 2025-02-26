import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }
}
