import 'package:flutter/material.dart';

import '../../utilities/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({
    Key? key,
    required this.text,
    this.size = 0,
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size==0? Dimensions.height(12) :size,
        color: color,
        height: height,
      ),
    );
  }
}
