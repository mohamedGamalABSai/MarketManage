import 'package:flutter/material.dart';

import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/services/function.dart';

abstract class AppStyles {
  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
        color: AppColors.brownColor,
        fontWeight: FontWeight.w500,
        fontSize: ScreenSize.screeenWidth(context) < 1200
            ? getResponsiveFontSize(context, fontSize: 18)
            : getResponsiveFontSize(context, fontSize: 20));
  }

  static TextStyle styleRegular30(BuildContext context) {
    return TextStyle(
        color: AppColors.brownColor,
        fontWeight: FontWeight.w500,
        fontSize: ScreenSize.screeenWidth(context) < 1200
            ? getResponsiveFontSize(context, fontSize: 25)
            : getResponsiveFontSize(context, fontSize: 30));
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .7;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return width / 450;
  } else if (width < 1200) {
    return width / 800;
  } else {
    return width / 1500;
  }
}