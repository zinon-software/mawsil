import 'package:flutter/material.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/text/small_text_widget.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  const IconAndText({Key? key, required this.icon, required this.iconColor, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
         SizedBox(width: Dimensions.heightDynamic(5),),
        SmallText(text: text,),
      ],
    );
  }
}