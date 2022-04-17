import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes.dart';
import '../../../controllers/popular_product_controller.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/dimensions.dart';
import '../../../widgets/icon/app_icon.dart';
import '../../../widgets/text/big_text_widget.dart';

class AppBarFoodView extends StatelessWidget {
  const AppBarFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(RouteHelper.initial),
          child: const AppIcon(
            icon: Icons.arrow_back_ios,
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(RouteHelper.getCart),
          child: GetBuilder<PopularProductController>(
            builder: (popularController) => Stack(
              children: [
                const AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
                popularController.totalItems >= 1
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: AppIcon(
                          icon: Icons.circle,
                          size: Dimensions.heightDynamic(20),
                          iconColor: Colors.transparent,
                          backgroundColor: AppColors.mainColor,
                        ),
                      )
                    : Container(),
                popularController.totalItems >= 1
                    ? Positioned(
                        top: Dimensions.heightDynamic(2),
                        right: Dimensions.heightDynamic(4),
                        child: BigText(
                          text: popularController.totalItems.toString(),
                          size: Dimensions.heightDynamic(13),
                          color: Colors.white,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
