import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState([]));

  void loadItems() {
    print('HomeCubit.loadItems() called');
    emit(HomeState(['Item 1', 'Item 2', 'Item 3']));
  }
}

class HomeState {
  final List<String> items;
  HomeState(this.items);
}
