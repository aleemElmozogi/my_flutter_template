import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFA020F0);
  static const Color hintText = Color.fromARGB(100, 26, 29, 27);
  static const Color backGround = Color.fromRGBO(248, 244, 240, 1);
  static const Color white = Colors.white;
  static Color red = Colors.red.shade500;
  static const Color yellow = Colors.yellow;
  static const Color grey = Colors.grey;
  static const Color black = Colors.black87;
  static const List<String> hexColors = [
    "d7d7d7",
    "f1f1f1",
    "e3e3e3",
    "cccccc",
    "dddddd",
    "eaeaea",
    "e4e491",
    "a7e26e",
    "eabf97",
  ];
  static String getRandomColor() {
    Random random = Random();
    int randomIndex = random.nextInt(AppColors.hexColors.length);
    return AppColors.hexColors[randomIndex];
  }
}
