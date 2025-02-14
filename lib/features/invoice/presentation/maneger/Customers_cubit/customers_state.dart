part of 'customers_cubit.dart';

sealed class CustomersState extends Equatable {
  const CustomersState();

  @override
  List<Object> get props => [];
}

final class CustomersInitial extends CustomersState {}

final class CustomersSuccess extends CustomersState {
  final List<CustomerModel> customers;

  CustomersSuccess({required this.customers});
}

final class CustomersLoading extends CustomersState {}

final class CustomersFailure extends CustomersState {
  final String errMessage;

  const CustomersFailure({required this.errMessage});
}
