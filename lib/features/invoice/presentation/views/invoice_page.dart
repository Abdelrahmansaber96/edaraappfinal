import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/router/appRouter.dart';
import 'package:edaraappfinal/core/styles/styles.dart';
import 'package:edaraappfinal/core/utils/api/dio_consumer.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/Customers_cubit/customers_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/all_areas_cubit/all_areas_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/category_cubit/cubit/category_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/product_data_cubit/cubit/product_data_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/products_page.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/area_drop_down_menu.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/category_drop_down_menu.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/customer_drop_down_menu.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CustomersCubit(DioConsumer(dio: Dio())),
          ),
          BlocProvider(
            create: (context) => CategoryCubit(DioConsumer(dio: Dio())),
          ),
          BlocProvider(
            create: (context) => ProductDataCubit(DioConsumer(dio: Dio())),
          ),
          
        ],
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('فاتورة بيع'),
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: AllAreasDropDownMenu()),
                            ),
                            CustomerDropDownMenu()
                          ],
                        ),
                        // second

                        const SizedBox(
                          height: 10,
                        ),

                        CategoryDropDowmMenu(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 80, horizontal: 20),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.width * 0.40,
                              child: ProductListView()),
                        )
                      ],
                    ),
                  ),
                )),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: kButtonColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: ProductSelectedListView()),
                  ),
                )
              ],
            )));
  }
}
