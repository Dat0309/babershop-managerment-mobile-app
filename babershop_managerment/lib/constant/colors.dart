// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

// ignore: unnecessary_import
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color? primaryColor = Color.fromARGB(255, 77, 142, 163);
  static const Color? primaryBgColor = Color.fromARGB(255, 247, 242, 230);
  static const Color? secondaryColor = Color.fromARGB(255, 223, 212, 192);
  static const Color? thirthColor = Color.fromARGB(255, 236, 231, 217);
  static const Color? primaryIconColor = Color(0xFFffd28d);
  static const Color? secondaryIconColor = Color(0xFFfcab88);
  static const Color? pargColor = Color(0xFF8f837f);
  static const Color? buttoBackgroundColor = Color(0xFFf7f6f4);
  static const Color? signColor = Color(0xFFE5E5E5);
  static const Color? titleColor = Color(0xFF979797);
  static const Color? mainBlackColor = Color(0xFF332d2b);
  static const Color? yellowColor = Color(0xFFffd379);
  static const Color? shadowColor = Color.fromARGB(255, 192, 192, 192);

  static const Color primaryColors = Color(0xff579BB1);
  static const Color secondColor = Color(0xff3E636F);
  static const Color text1Color = Color(0xff323B4B);
}

class Gradients {
  static const Gradient defualtGradientBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [AppColors.primaryColors, AppColors.secondColor],
  );
}

// class Gradients {

