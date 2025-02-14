import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'invoice_cubit_state.dart';

class InvoiceCubitCubit extends Cubit<InvoiceCubitState> {
  InvoiceCubitCubit() : super(InvoiceCubitInitial());
}
