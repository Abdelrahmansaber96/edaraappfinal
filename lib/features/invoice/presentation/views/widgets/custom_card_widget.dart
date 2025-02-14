import 'dart:convert';

import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/router/appRouter.dart';
import 'package:edaraappfinal/core/utils/assets.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/increments_quantity_cubit/cubit/quantity_increment_cubit.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.imgUrl,
      required this.price,
      required this.productname,
      required this.productstock});
  final double price;
  final String imgUrl;
  final String productname;
  final String productstock;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuantityIncrementCubit, QuantityIncrementState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<QuantityIncrementCubit>(context)
                .counterplus(button: 'minus', price: price);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    elevation: 50,
                    scrollable: true,
                    backgroundColor: kPrimaryColor,
                    title: const Center(child: Text('اضافة صف للفاتورة ')),
                    content: Column(
                      children: [
                        CustomStepper(
                          price: price,
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            '${BlocProvider.of<QuantityIncrementCubit>(context).finalprice}',
                            style: const TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              fillColor: kCardColor,
                              suffixIcon: Icon(Icons.price_change_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'الاجمالى الفعلى'),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 20,
                    offset: Offset(10, 10),
                  ),
                ]),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productname,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'السعر  $price',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الكمية $productstock',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Icon(
                              Icons.shopping_basket_outlined,
                              color: kButtonColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 15,
                top: -60,
                child: Image.memory(
                  base64Decode(imgUrl),
                  height: 90,
                  width: 90,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
