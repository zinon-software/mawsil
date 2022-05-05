import 'package:flutter/material.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/widgets/icon/app_icon.dart';
import 'package:mawsil/src/widgets/text/big_text_widget.dart';

class CartHistoryView extends StatelessWidget {
  const CartHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 45, bottom: 5),
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
          )
        ],
      ),
    );
  }
}
