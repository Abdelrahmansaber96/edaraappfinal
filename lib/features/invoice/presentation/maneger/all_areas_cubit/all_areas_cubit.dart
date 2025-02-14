import 'package:bloc/bloc.dart';
import 'package:edaraappfinal/core/utils/api/Endpoints.dart';
import 'package:edaraappfinal/core/utils/api/api_consumer.dart';
import 'package:edaraappfinal/core/utils/errors/Exepctions.dart';
import 'package:edaraappfinal/features/invoice/data/models/areamodel/areas_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'all_areas_state.dart';

class AllAreasCubit extends Cubit<AllAreasState> {
  AllAreasCubit(this.api) : super(AllAreasInitial());
  final ApiConsumer api;

  fetchAllAreas() async {
    try {
      emit(AllAreasLoading());
      final response = await api.get(EndPoints.getallareas);
      List<AreasModel> allAreas = [];
      for (int i = 0; i < response.length; i++) {
        allAreas.add(
          AreasModel.fromJson(response[i]),
        );
      }
      emit(AllAreasSuccess(areas: allAreas));
    } on ServerException catch (e) {
      emit(AllAreasFailure(errMessage: e.errMessage));
    }
  }
}
