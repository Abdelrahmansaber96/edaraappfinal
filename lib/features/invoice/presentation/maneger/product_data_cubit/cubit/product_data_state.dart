part of 'product_data_cubit.dart';

sealed class ProductDataState extends Equatable {
  const ProductDataState();

  @override
  List<Object> get props => [];
}

final class ProductDataInitial extends ProductDataState {}

final class ProductDataSuccess extends ProductDataState {
  final List<ProductDataModel> products;

  ProductDataSuccess({required this.products});
}

final class ProductDataLoading extends ProductDataState {}

final class ProductDataFailure extends ProductDataState {
  final String errMessage;

  ProductDataFailure({required this.errMessage});
}
