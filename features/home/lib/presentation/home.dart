import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/core/di/injector.dart';
import 'package:home/presentation/cubit/movies_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MoviesCubit>()..getMovies(),
      child: Scaffold(
        appBar: AppBar(title: Text('Home Pagee')),
        body: Center(
          child: Text('This is initial page'),
        ),
      ),
    );
  }
}
