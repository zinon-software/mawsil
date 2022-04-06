import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/text/big_text_widget.dart';

import '../../controllers/popular_product_controller.dart';
import '../../models/product_model.dart';
import '../../widgets/column.dart';
import '../../widgets/icon/app_icon.dart';
import '../../widgets/text/exandable_text_widget.dart';

class PopularFoodDetailView extends StatelessWidget {
  final int pageId;
  const PopularFoodDetailView({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>().initProduct();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.heightDynamic(350),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 173, 157, 5),
                image: DecorationImage(
                  image: NetworkImage(product.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // icon Widgets
          Positioned(
            top: Dimensions.heightDynamic(45),
            left: Dimensions.heightDynamic(20),
            right: Dimensions.heightDynamic(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                const AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),
          // introduction of food
          Positioned(
            top: Dimensions.heightDynamic(325),
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(Dimensions.heightDynamic(20)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.heightDynamic(20)),
                  topRight: Radius.circular(Dimensions.heightDynamic(20)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    popularProduct: product,
                  ),
                  SizedBox(height: Dimensions.heightDynamic(20)),
                  BigText(text: "Indroduce"),
                  SizedBox(height: Dimensions.heightDynamic(20)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Icon favorite
          Positioned(
            top: Dimensions.heightDynamic(305),
            right: Dimensions.heightDynamic(35),
            child: AppIcon(
              icon: Icons.favorite,
              iconColor: Colors.white,
              backgroundColor: AppColors.mainColor,
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularController) => Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => popularController.setQuantity(false),
                      child: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.heightDynamic(10) / 2,
                    ),
                    BigText(text: popularController.quantity.toString()),
                    SizedBox(
                      width: Dimensions.heightDynamic(10) / 2,
                    ),
                    GestureDetector(
                      onTap: () => popularController.setQuantity(true),
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.heightDynamic(20)),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(
                    Dimensions.heightDynamic(20),
                  ),
                ),
                child: BigText(
                  text: "\$${product.price} | Add to cart",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
