import 'package:flutter/material.dart';
import 'package:mawsil/src/utilities/app_colors.dart';

import '../../../../utilities/dimensions.dart';
import '../../../../widgets/text/big_text_widget.dart';
import '../../../../widgets/text/small_text_widget.dart';

class AppBarMainView extends StatelessWidget {
  const AppBarMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.heightDynamic(15),
        bottom: Dimensions.heightDynamic(15),
      ),
      padding: EdgeInsets.only(
        right: Dimensions.heightDynamic(20),
        left: Dimensions.heightDynamic(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(
                text: "contry",
                color: AppColors.mainColor,
                size: Dimensions.heightDynamic(25),
              ),
              Row(
                children: [
                  SmallText(
                    text: "city",
                    color: Colors.black54,
                    size: Dimensions.heightDynamic(15),
                  ),
                  const Icon(Icons.arrow_drop_down_rounded)
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              height: Dimensions.heightDynamic(50),
              width: Dimensions.heightDynamic(50),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.heightDynamic(15))),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
