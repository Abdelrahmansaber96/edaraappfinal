part of 'invoice_cubit_cubit.dart';

sealed class InvoiceCubitState extends Equatable {
  const InvoiceCubitState();

  @override
  List<Object> get props => [];
}

final class InvoiceCubitInitial extends InvoiceCubitState {}
