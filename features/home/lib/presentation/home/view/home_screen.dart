import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/presentation/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Text("Home"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.get<HomeCubit>().getMovies(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
