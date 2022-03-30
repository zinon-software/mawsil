import 'package:flutter/material.dart';
import 'package:mawsil/src/utilities/app_colors.dart';

import '../../../utilities/dimensions.dart';
import '../../../widgets/text/big_text_widget.dart';
import '../../../widgets/text/small_text_widget.dart';

class AppBarMainView extends StatelessWidget {
  const AppBarMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height(15), bottom: Dimensions.height(15)),
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(text: "contry",color: AppColors.mainColor,),
              Row(
                children: [
                  SmallText(text: "city", color: Colors.black54,),
                  const Icon(Icons.arrow_drop_down_rounded)
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Icon(Icons.search, color:Colors.white,),),
          ),
        ],
      ),
    );
  }
}