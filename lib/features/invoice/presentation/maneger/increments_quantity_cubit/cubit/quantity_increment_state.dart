part of 'quantity_increment_cubit.dart';

sealed class QuantityIncrementState {
  const QuantityIncrementState();

  @override
  List<Object> get props => [];
}

final class QuantityIncrementInitial extends QuantityIncrementState {
  QuantityIncrementInitial();
}
final class QuantityIncrementPlus extends QuantityIncrementState {}
final class QuantityIncrementMinus extends QuantityIncrementState {}
// final class QuantityIncrementPricePlus extends QuantityIncrementState {}
// final class QuantityIncrementPriceMinus extends QuantityIncrementState {}