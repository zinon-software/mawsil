import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/text/big_text_widget.dart';

import '../../../routes.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../models/product_model.dart';
import '../../widgets/icon/app_icon.dart';
import '../../widgets/text/exandable_text_widget.dart';

class RecommendedFoodDetailView extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetailView({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendeProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.heightDynamic(80),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                GestureDetector(
                  onTap: ()=> Get.toNamed(RouteHelper.initial),
                  child: const AppIcon(
                    icon: Icons.close,
                  ),
                ),
                const AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
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
                    text:
                        product.description!,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                  iconSize: Dimensions.heightDynamic(24),
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.remove,
                ),
                BigText(
                  text: "\$${product.price} x 0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.heightDynamic(26),
                ),
                AppIcon(
                  iconSize: Dimensions.heightDynamic(24),
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  icon: Icons.add,
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
        ],
      ),
    );
  }
}
