import 'package:get_it/get_it.dart';
import 'package:home/di/injector.config.dart';
import 'package:injectable/injectable.dart';

final getHomeIt = GetIt.instance;

@InjectableInit()
void configureHomeDependencies() => getHomeIt.init();
