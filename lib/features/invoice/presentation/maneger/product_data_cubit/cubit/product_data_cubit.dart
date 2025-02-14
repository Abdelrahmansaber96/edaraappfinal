import 'package:bloc/bloc.dart';
import 'package:edaraappfinal/core/utils/api/Endpoints.dart';
import 'package:edaraappfinal/core/utils/api/api_consumer.dart';
import 'package:edaraappfinal/core/utils/errors/Exepctions.dart';
import 'package:edaraappfinal/features/invoice/data/models/ProductDataModel/product_data_model/product_data_model.dart';
import 'package:equatable/equatable.dart';

part 'product_data_state.dart';

class ProductDataCubit extends Cubit<ProductDataState> {
  ProductDataCubit(this.api) : super(ProductDataInitial());
  final ApiConsumer api;

  fetchAllProducts(String categotyid) async {
    try {
      emit(ProductDataLoading());
      final response = await api.get(EndPoints.getProductData(categotyid));
      List<ProductDataModel> products = [];
      for (int i = 0; i < response.length; i++) {
        products.add(
          ProductDataModel.fromJson(response[i]),
        );
      }
      emit(ProductDataSuccess(products: products));
    } on ServerException catch (e) {
      emit(ProductDataFailure(errMessage: e.errMessage));
    }
  }
}
