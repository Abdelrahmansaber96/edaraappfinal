part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccess({required this.categories});
}

final class CategoryLoading extends CategoryState {}

final class CategoryFailure extends CategoryState {
  final String errMessage;

  CategoryFailure({required this.errMessage});
}
