import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/styles/styles.dart';
import 'package:edaraappfinal/features/invoice/presentation/maneger/increments_quantity_cubit/cubit/quantity_increment_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomStepper extends StatelessWidget {
  CustomStepper({
    super.key,
    required this.price,
  });
  final double price;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityIncrementCubit(),
      child: BlocConsumer<QuantityIncrementCubit, QuantityIncrementState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          int quantity = 1;
          double totalPrice = price;
          if (state is QuantityIncrementUpdated) {
            quantity = state.quantity;
            totalPrice = state.totalPrice;
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedIconButton(
                    icon: Icons.remove,
                    iconSize: 45,
                    onPress: () {
                      BlocProvider.of<QuantityIncrementCubit>(context)
                          .counterplus(button: 'minus', price: price);
                    },
                  ),
                  Container(
                    width: 50,
                    child: Text(
                      '${quantity}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RoundedIconButton(
                    icon: Icons.add,
                    iconSize: 45,
                    onPress: () {
                      BlocProvider.of<QuantityIncrementCubit>(context)
                          .counterplus(button: 'plus', price: price);
                    },
                  ),
                ],
              ),
              Container(
                child: Text('${totalPrice}',style:const TextStyle(fontSize: 28),),
              )
            ],
          );
        },
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {super.key,
      required this.icon,
      required this.onPress,
      required this.iconSize});

  final IconData icon;
  final VoidCallback onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: onPress,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconSize * 0.2)),
      fillColor: kButtonColor,
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}
