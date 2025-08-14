import 'package:flutter/material.dart';

class Responsive {
  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;
  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 850;
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1100 &&
      MediaQuery.sizeOf(context).width >= 850;

  static isDesck(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1100;
}
