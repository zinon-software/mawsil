import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/controllers/cart_controller.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/icon/app_icon.dart';

import '../../../routes.dart';
import '../../controllers/popular_product_controller.dart';
import '../../widgets/text/big_text_widget.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.heightDynamic(20) * 3,
            left: Dimensions.heightDynamic(20),
            right: Dimensions.heightDynamic(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.heightDynamic(20),
                  ),
                ),
                SizedBox(width: Dimensions.heightDynamic(20)*5),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.initial),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.heightDynamic(20),
                  ),
                ),
                GestureDetector(
          onTap: () => Get.toNamed(RouteHelper.getCart),
          child: GetBuilder<CartController>(
            builder: (cartController) => Stack(
              children: [
               AppIcon(
                  icon: Icons.shopping_cart_checkout,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.heightDynamic(20),
                ),
                cartController.totalItems >= 1
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: AppIcon(
                          icon: Icons.circle,
                          size: Dimensions.heightDynamic(20),
                          iconColor: Colors.transparent,
                          backgroundColor: Colors.white,
                        ),
                      )
                    : Container(),
                cartController.totalItems >= 1
                    ? Positioned(
                        top: Dimensions.heightDynamic(2),
                        right: Dimensions.heightDynamic(4),
                        child: BigText(
                          text: cartController.totalItems.toString(),
                          size: Dimensions.heightDynamic(13),
                          color: Colors.black,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      
              ],
            ),
          )
        ],
      ),
       bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) => Container(
          height: Dimensions.heightDynamic(120),
          padding: EdgeInsets.only(
              left: Dimensions.heightDynamic(20),
              right: Dimensions.heightDynamic(20)),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.heightDynamic(30) + 2),
              topRight: Radius.circular(Dimensions.heightDynamic(30) + 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.heightDynamic(20)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    Dimensions.heightDynamic(20),
                  ),
                ),
                child: BigText(text: "\$ 00.00"),
              ),
              GestureDetector(
      onTap: () => print("chech out"),
      child: Container(
        padding: EdgeInsets.all(Dimensions.heightDynamic(20)),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(
            Dimensions.heightDynamic(20),
          ),
        ),
        child: BigText(
          text:
              "Check Out",
          color: Colors.white,
        ),
      ),
    ),
            ],
          ),
        ),
      ),
    
    );
  }
}
