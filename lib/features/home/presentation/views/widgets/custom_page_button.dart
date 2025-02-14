import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:edaraappfinal/core/styles/styles.dart';
import 'package:edaraappfinal/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomPageButton extends StatelessWidget {
  const CustomPageButton(
      {super.key,
      required this.text,
      required this.pageRoute,
      required this.image});
  final String text;
  final String image;
  final Function pageRoute;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageRoute();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 140, 173, 197),
                  Color.fromARGB(255, 97, 138, 168),
                  Color.fromARGB(255, 91, 116, 155),
                ]),
                borderRadius: BorderRadius.circular(20),
                color: kButtonColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      width: MediaQuery.of(context).size.height * 0.1, image),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    text,
                    style: Sytles.buttonTitle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
