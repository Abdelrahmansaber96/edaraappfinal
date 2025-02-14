import 'package:edaraappfinal/features/invoice/presentation/maneger/product_data_cubit/cubit/product_data_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/card_selected_items.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSelectedListView extends StatelessWidget {
  const ProductSelectedListView({super.key});

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
                ? GridView.builder(
                    itemCount: state.products.length,
                    clipBehavior: Clip.none,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CardSelectedItems(
                          productstock:
                              state.products[index].productStock.toString(),
                          productname:
                              state.products[index].productName.toString(),
                          price: state.products[index].productPrice.toString(),
                          imgUrl: state.products[index].productImage!,
                        ),
                      );
                    })
                : Container(
                    child: Center(child: Text('لم يتم اختيار منتجات')),
                  );
      },
    );
  }
}
