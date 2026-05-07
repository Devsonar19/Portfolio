import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const ResponsiveLayout({super.key, required this.mobile, required this.desktop});

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800 ? true : false;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 ? true : false;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth > 800) {
        return desktop;
      } else {
        return mobile;
      }
    });
  }
}
