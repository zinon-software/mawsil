import 'package:flutter/material.dart';
import 'package:mawsil/src/models/product_model.dart';

import '../utilities/app_colors.dart';
import '../utilities/dimensions.dart';
import 'icon_and_text/icon_and_text_widget.dart';
import 'text/big_text_widget.dart';
import 'text/small_text_widget.dart';

class AppColumn extends StatelessWidget {
  final ProductModel popularProductList;
  const AppColumn({Key? key, required this.popularProductList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BigText(text: "${popularProductList.name}", size: Dimensions.heightDynamic(23),),
        // BigText(text: "Chinese Side", size: Dimensions.heightDynamic(26),),
        SizedBox(height: Dimensions.heightDynamic(8)),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.heightDynamic(20),
                ),
              ),
            ),
            SizedBox(width: Dimensions.heightDynamic(10)),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.widthDynamic(10)),
            SmallText(text: "1287"),
            SizedBox(width: Dimensions.heightDynamic(10)),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.heightDynamic(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1,
                text: "Normal"),
            IconAndText(
                icon: Icons.location_on,
                iconColor: AppColors.mainColor,
                text: "1.7km"),
            IconAndText(
                icon: Icons.access_time_rounded,
                iconColor: AppColors.iconColor2,
                text: "32"),
          ],
        )
      ],
    );
  }
}
