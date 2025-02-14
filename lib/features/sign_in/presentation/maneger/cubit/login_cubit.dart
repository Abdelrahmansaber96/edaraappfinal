import 'package:dio/dio.dart';
import 'package:edaraappfinal/core/utils/api/Endpoints.dart';
import 'package:edaraappfinal/core/utils/api/api_consumer.dart';
import 'package:edaraappfinal/core/utils/database/cache/cache_helper.dart';
import 'package:edaraappfinal/core/utils/errors/Exepctions.dart';
import 'package:edaraappfinal/features/invoice/data/models/permission_model/permission.dart';
import 'package:edaraappfinal/features/sign_in/data/models/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());

  final ApiConsumer api;

  GlobalKey<FormState> signInFormKey = GlobalKey();
//Sign in email
  TextEditingController signInUserName = TextEditingController();
//Sign in password
  TextEditingController signInPassword = TextEditingController();
  LoginModel? user;
  PermissionModel? permission;
  login() async {
    try {
      emit(LoginLoading());
      final response = await api.post(EndPoints.login, data: {
        ApiKey.userName: signInUserName.text,
        ApiKey.password: signInPassword.text,
      });
      user = LoginModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      user!.repid != null
          ? CacheHelper().saveData(key: ApiKey.repid, value: user!.repid)
          : null;
      emit(LoginSuccess());
    } on ServerException catch (e) {
      emit(LoginFailure(errMessage: e.errMessage));
    }
  }

  getPermissionId() async {
    try {
      emit(PermissionLoading());
      final response = await api.get(
          EndPoints.getPermissionId(CacheHelper().getData(key: ApiKey.repid)));
      permission = PermissionModel.fromJson(response);
      permission!.permissionId != null
          ? CacheHelper().saveData(
              key: ApiKey.permissionId, value: permission!.permissionId)
          : print(permission!.message.toString());
      emit(PermissionSuccess());
    } on ServerException catch (e) {
      emit(PermissionFailure(errMessage: e.errMessage));
    }
  }
}
