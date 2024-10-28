import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  // final Widget? tablet;
  final Widget desktop;

  final Widget tablet;


  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet
  });



  // This isMobile, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
       MediaQuery.of(context).size.width >= 850 ;


  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1400;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop;
    }
    else if (size.width >= 1100) {
      return tablet;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
