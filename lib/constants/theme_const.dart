import 'package:flutter/material.dart';
import 'package:sms_email/constants/colors_const.dart';

class ThemeConst {

  ThemeConst._();

  static getApplicationTheme(){

    return ThemeData(
      scaffoldBackgroundColor: ColorsConst.primary,
      fontFamily: 'Slussen',
      colorScheme: ThemeData().colorScheme.copyWith(
        primary: ColorsConst.primary,
        secondary: Colors.white,
      )
    );
  }

}