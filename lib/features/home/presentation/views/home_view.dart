import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/router/appRouter.dart';
import 'package:edaraappfinal/core/styles/styles.dart';
import 'package:edaraappfinal/core/utils/api/Endpoints.dart';
import 'package:edaraappfinal/core/utils/assets.dart';
import 'package:edaraappfinal/core/utils/database/cache/cache_helper.dart';
import 'package:edaraappfinal/features/home/presentation/views/widgets/custom_page_button.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/all_areas_cubit/all_areas_cubit.dart';
import 'package:edaraappfinal/features/sign_in/presentation/maneger/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<AllAreasCubit, AllAreasState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPageButton(
                            text: 'فاتورة بيع',
                            image: AssetsData.invoicebutton,
                            pageRoute: () {
                              GoRouter.of(context).push(AppRouter.kInvoicePage);
                              context.read<AllAreasCubit>().fetchAllAreas();
                              print(CacheHelper().getData(key: ApiKey.repid));
                              CacheHelper().getData(key: ApiKey.repid) != null
                                  ? context.read<LoginCubit>().getPermissionId()
                                  : null;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(context
                                      .read<LoginCubit>()
                                      .permission!
                                      .message
                                      .toString()),
                                ),
                              );
                            }),
                        CustomPageButton(
                            text: 'اضافة عميل',
                            image: AssetsData.customerbutton,
                            pageRoute: () {}),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPageButton(
                            text: 'اذن صرف',
                            image: AssetsData.analyticsbutton,
                            pageRoute: () {}),
                        CustomPageButton(
                            text: 'تسويةاذن الصرف',
                            image: AssetsData.permissionbutton,
                            pageRoute: () {}),
                      ],
                    ),
                    CustomPageButton(
                        text: 'جرد المخزن',
                        image: AssetsData.storebutton,
                        pageRoute: () {}),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
