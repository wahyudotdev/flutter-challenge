import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xff28A2DE);
  static const secondary = Color(0xff18978F);
  static const textBlack = Color(0xFF030303);
  static const textGray = Color(0xFFBABABA);
  static const softGray = Color(0xFFF3F3F3);

  static final primarySwatch = MaterialColor(
    primary.value,
    const {
      50: Color(0xffe9f5fb), //10%
      100: Color(0xffd4ecf8), //20%
      200: Color(0xffbee3f5), //30%
      300: Color(0xffa9d9f1), //40%
      400: Color(0xff93d0ee), //50%
      500: Color(0xff7ec7eb), //60%
      600: Color(0xff68bde7), //70%
      700: Color(0xff53b4e4), //80%
      800: Color(0xff3dabe1), //90%
      900: Color(0xff28a2de), //100%
    },
  );
}
