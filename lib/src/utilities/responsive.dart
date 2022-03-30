import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 600;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tab;
  final Widget? desktop;
  const Responsive({Key? key, this.mobile, this.tab, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isMobile(context)) {
        return mobile!;
      } else if (isTab(context)) {
        return tab!;
      } else {
        return desktop!;
      }
    });
  }
}
