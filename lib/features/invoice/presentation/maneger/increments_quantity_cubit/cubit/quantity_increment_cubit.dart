import 'package:bloc/bloc.dart';
part 'quantity_increment_state.dart';

class QuantityIncrementCubit extends Cubit<QuantityIncrementState> {
  QuantityIncrementCubit() : super(QuantityIncrementInitial());

  int value1 = 1;
  double finalprice = 1;

  void counterplus({required String button, required double price}) {
    if (button == 'plus') {
      if (value1 < 50) {
        value1 += 1;
      }
    } else {
      if (value1 > 1) {
        value1 -= 1;
      }
    }

    finalprice = price * value1;
    emit(QuantityIncrementUpdated(value1, finalprice));
  }
}