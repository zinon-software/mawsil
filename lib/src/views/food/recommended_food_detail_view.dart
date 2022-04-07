import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/controllers/popular_product_controller.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/views/food/components/app_bar_food.dart';
import 'package:mawsil/src/widgets/text/big_text_widget.dart';

import '../../../routes.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../models/product_model.dart';
import '../../widgets/icon/app_icon.dart';
import '../../widgets/text/exandable_text_widget.dart';

class RecommendedFoodDetailView extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetailView({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendeProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.heightDynamic(80),
            title: const AppBarFoodView(),
            bottom: PreferredSize(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.heightDynamic(20)),
                        topRight: Radius.circular(Dimensions.heightDynamic(20)),
                      ),
                    ),
                    padding: EdgeInsets.only(
                        top: Dimensions.heightDynamic(5),
                        bottom: Dimensions.heightDynamic(10)),
                    width: double.maxFinite,
                    child: Center(
                        child: BigText(
                      text: product.name!,
                      size: Dimensions.heightDynamic(26),
                    ))),
                preferredSize: Size.fromHeight(Dimensions.heightDynamic(20))),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: Dimensions.heightDynamic(300),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.heightDynamic(20),
                    right: Dimensions.heightDynamic(20),
                  ),
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.heightDynamic(10),
                bottom: Dimensions.heightDynamic(10),
                left: Dimensions.heightDynamic(20) * 2.5,
                right: Dimensions.heightDynamic(20) * 2.5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => popularController.inCartItems <= 0
                        ? Get.snackbar("Item count", "You can't reduce more !",
                            backgroundColor: AppColors.mainColor,
                            colorText: Colors.white)
                        : popularController.setQuantity(false),
                    child: AppIcon(
                      iconSize: Dimensions.heightDynamic(24),
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.remove,
                    ),
                  ),
                  BigText(
                    text:
                        "\$${product.price} x ${popularController.inCartItems.toString()}",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.heightDynamic(26),
                  ),
                  GestureDetector(
                    onTap: () => popularController.inCartItems >= 20
                        ? Get.snackbar("Item count", "You can't add more !",
                            backgroundColor: AppColors.mainColor,
                            colorText: Colors.white)
                        : popularController.setQuantity(true),
                    child: AppIcon(
                      iconSize: Dimensions.heightDynamic(24),
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.add,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                  AppIcon(
                    icon: Icons.favorite,
                    iconColor: AppColors.mainColor,
                    backgroundColor: Colors.white,
                    iconSize: Dimensions.heightDynamic(24),
                  ),
                  GestureDetector(
                    onTap: () => popularController.addItem(product),
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
                            "\$${popularController.inCartItems == 0 ? product.price! : product.price! * popularController.inCartItems} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
