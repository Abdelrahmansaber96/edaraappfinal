import 'package:dio/dio.dart';
import 'package:edaraappfinal/core/router/appRouter.dart';
import 'package:edaraappfinal/core/utils/api/api_consumer.dart';
import 'package:edaraappfinal/core/utils/api/dio_consumer.dart';
import 'package:edaraappfinal/core/utils/database/cache/cache_helper.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/Customers_cubit/customers_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/all_areas_cubit/all_areas_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/increments_quantity_cubit/cubit/quantity_increment_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/product_data_cubit/cubit/product_data_cubit.dart';
import 'package:edaraappfinal/features/sign_in/presentation/maneger/cubit/login_cubit.dart';
import 'package:edaraappfinal/features/sign_in/presentation/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginCubit(DioConsumer(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => AllAreasCubit(DioConsumer(dio: Dio())),
      ),
       BlocProvider(
        create: (context) => QuantityIncrementCubit(),
      ),
    ],
    child: MaterialApp.router(
      routerConfig: AppRouter.router,
    ),
  ));
}
