import 'package:bloc/bloc.dart';
import 'package:edaraappfinal/core/utils/api/Endpoints.dart';
import 'package:edaraappfinal/core/utils/api/api_consumer.dart';
import 'package:edaraappfinal/core/utils/errors/Exepctions.dart';
import 'package:edaraappfinal/features/invoice/data/models/categorymodel/category_model/category_model.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.api) : super(CategoryInitial());
  final ApiConsumer api;

  fetchAllCategories() async {
    try {
      emit(CategoryLoading());
      final response = await api.get(EndPoints.getactivecategories);
      List<CategoryModel> categories = [];
      for (int i = 0; i < response.length; i++) {
        categories.add(
          CategoryModel.fromJson(response[i]),
        );
        emit(CategorySuccess(categories: categories));
      }
    } on ServerException catch (e) {
      emit(CategoryFailure(errMessage: e.errMessage));
    }
  }
}
