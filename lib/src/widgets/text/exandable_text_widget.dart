import 'package:flutter/material.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/text/small_text_widget.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddText = true;

  double textHeight = Dimensions.heightDynamic(150);

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
                  size: Dimensions.heightDynamic(16),
                  height: 1.8,
                  color: AppColors.paraColor,
            text: firstHalf)
          : Column(
              children: [
                SmallText(
                  size: Dimensions.heightDynamic(16),
                  color: AppColors.paraColor,
                  height: 1.8,
                  text: hiddText ? firstHalf + "..." : firstHalf + secondHalf,
                ),
                InkWell(
                  onTap: () => setState(()=> hiddText = !hiddText),
                  child: Row(
                    children: [
                      SmallText(
                  size: Dimensions.heightDynamic(16),
                        text: "Show more", color: AppColors.mainColor,),
                      Icon(hiddText ? Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
