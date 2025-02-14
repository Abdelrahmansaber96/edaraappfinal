part of 'all_areas_cubit.dart';

sealed class AllAreasState extends Equatable {
  const AllAreasState();

  @override
  List<Object> get props => [];
}

final class AllAreasInitial extends AllAreasState {}

final class AllAreasSuccess extends AllAreasState {
  final List<AreasModel> areas;

  AllAreasSuccess({required this.areas});
}

final class AllAreasLoading extends AllAreasState {}

final class AllAreasFailure extends AllAreasState {
  final String errMessage;

  const AllAreasFailure({required this.errMessage});
}
