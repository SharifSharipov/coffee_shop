import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCubit extends Cubit<int> {
  SizeCubit() : super(0);

  void changeSize(int index) {
    emit(index);
  }
}
