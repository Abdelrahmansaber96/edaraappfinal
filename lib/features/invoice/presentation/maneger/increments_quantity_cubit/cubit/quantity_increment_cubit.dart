import 'dart:ffi';

import 'package:bloc/bloc.dart';
part 'quantity_increment_state.dart';

class QuantityIncrementCubit extends Cubit<QuantityIncrementState> {
  QuantityIncrementCubit() : super(QuantityIncrementInitial());
  int value1 = 1;
  double finalprice = 1;
  void counterplus({required button, required double price}) {
    if (button == 'plus') {
      
      value1 == 50 ? 50 : value1 += 1;
      finalprice = price * value1;
      emit(QuantityIncrementPlus());
    } else {
      value1 == 1 ? 1 : value1 -= 1;
       finalprice = price * value1;
      emit(QuantityIncrementMinus());
    }
  }
}
