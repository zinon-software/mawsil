import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/dimensions.dart';
import '../../../../widgets/icon/app_icon.dart';
import '../../../../widgets/text/big_text_widget.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isWindows ? 50 : Dimensions.heightDynamic(100),
      color: AppColors.mainColor,
      width: double.maxFinite,
      padding: EdgeInsets.only(
        top: Platform.isWindows ? 0 : Dimensions.heightDynamic(45),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BigText(
            text: "Cart History",
            color: Colors.white,
          ),
          AppIcon(
            icon: Icons.shopping_cart,
            iconColor: AppColors.mainColor,
            // backgroundColor: AppColors.buttonBackgroundColor,
          ),
        ],
      ),
    );
  }
}
