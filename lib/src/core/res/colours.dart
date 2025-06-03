import 'package:flutter/material.dart';

class Colours {
  const Colours._();

  static const primaryColor = Color(0xFF22A987);

  static const darkGreenColor = Color(0xFF196954);

  static const whiteColor = Color(0xFFFFFFFF);

  static const blackColor = Color(0xFF212625);

  static const greyColor = Color(0xFFBCBCBC);

  static const greyTextFieldStrokeColor = Color(0xFFD0D5DD);

  static const hintColor = Color(0xFF656972);

  static const Color errorColor = Color(0xFFFF2C20);

  static LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF179071),
      Color(0xFF22A987),
    ],
    stops: [0, 0.71],
    begin: Alignment.center,
    end: Alignment.bottomCenter,
  );
}
