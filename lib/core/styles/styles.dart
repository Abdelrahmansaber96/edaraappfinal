import 'package:edaraappfinal/core/constants/constants.dart';
import 'package:flutter/material.dart';

abstract class Sytles {
  static const buttonTitle = TextStyle(
      color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w600);

  static const title = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w800, fontFamily: kChangaFont);

  static const titleInvoice = TextStyle(
      color: kPrimaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w800,
      fontFamily: kChangaFont);
  static const titleInvoice2 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, fontFamily: kChangaFont);
}
