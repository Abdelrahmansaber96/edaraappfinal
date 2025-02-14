import 'package:bloc/bloc.dart';
import 'package:edaraappfinal/core/utils/api/Endpoints.dart';
import 'package:edaraappfinal/core/utils/api/api_consumer.dart';
import 'package:edaraappfinal/core/utils/errors/Exepctions.dart';
import 'package:edaraappfinal/features/invoice/data/models/customer_model/customer_model.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/all_areas_cubit/all_areas_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customers_state.dart';

class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit(this.api) : super(CustomersInitial());
  final ApiConsumer api;

  GlobalKey<FormState> allAreasFormKey = GlobalKey();
//Sign in email
  TextEditingController allAreasSelected = TextEditingController();

  fetchAllCustomers(String selectedAreaId) async {
    print(selectedAreaId);
    try {
      emit(CustomersLoading());
      final response = await api.get(EndPoints.getAllCustomers(selectedAreaId));
      List<CustomerModel> allcustomers = [];
      for (int i = 0; i < response.length; i++) {
        allcustomers.add(
          CustomerModel.fromJson(response[i]),
        );
      }
      emit(CustomersSuccess(customers: allcustomers));
    } on ServerException catch (e) {
      emit(CustomersFailure(errMessage: e.errMessage));
    }
  }
}
