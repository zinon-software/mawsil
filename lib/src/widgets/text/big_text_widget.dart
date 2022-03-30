import 'package:flutter/material.dart';

import '../../utilities/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      required this.text,
      this.size = 0,
      this.color = const Color(0xFF332d2d),
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontSize: size==0? Dimensions.height(20) :size ,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
