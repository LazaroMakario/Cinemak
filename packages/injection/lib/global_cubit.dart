import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalCubit extends Cubit<String> {
  GlobalCubit() : super('');

  void updateMessage(String message) {
    emit(message);
  }
}
