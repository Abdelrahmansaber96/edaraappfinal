part of 'quantity_increment_cubit.dart';

abstract class QuantityIncrementState {}

class QuantityIncrementInitial extends QuantityIncrementState {}

class QuantityIncrementUpdated extends QuantityIncrementState {
  final int quantity;
  final double totalPrice;

  QuantityIncrementUpdated(this.quantity, this.totalPrice);
}