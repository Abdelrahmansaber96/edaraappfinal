import 'dart:convert';

import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CardSelectedItems extends StatelessWidget {
  const CardSelectedItems(
      {super.key,
      required this.imgUrl,
      required this.price,
      required this.productname,
      required this.productstock});
  final String price;
  final String imgUrl;
  final String productname;
  final String productstock;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          right: 10,
          top: 10,
          child: Image.memory(
            base64Decode(imgUrl),
            height: 60,
            width: 60,
          ),
        )
      ],
    );
  }
}
