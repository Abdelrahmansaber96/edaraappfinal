import 'package:edaraappfinal/features/invoice/presentation/maneger/product_data_cubit/cubit/product_data_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDataCubit, ProductDataState>(
      listener: (context, state) {
        if (state is ProductDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return state is ProductDataLoading
            ? const Center(child: CircularProgressIndicator())
            : state is ProductDataSuccess
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ListView.builder(
                        itemCount: state.products.length,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomCard(
                              productstock:
                                  state.products[index].productStock.toString(),
                              productname:
                                  state.products[index].productName.toString(),
                              price:
                                  state.products[index].productPrice!,
                              imgUrl: state.products[index].productImage!,
                            ),
                          );
                        }),
                  )
                : Container(
                    child: Text('برجاء اختيار التصنيف'),
                  );
      },
    );
  }
}
