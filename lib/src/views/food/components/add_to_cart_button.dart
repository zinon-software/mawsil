import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mawsil/src/controllers/popular_product_controller.dart';
import 'package:mawsil/src/models/product_model.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/dimensions.dart';
import '../../../widgets/text/big_text_widget.dart';

class AddToCartFoodView extends StatelessWidget {
  final ProductModel product;
  final PopularProductController popularController;
  const AddToCartFoodView(
      {Key? key, required this.product, required this.popularController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
        builder: (recommendedProducts) => GestureDetector(
        onTap: () async {
          popularController.setAddToCart = true;
          popularController.addItem(product);
          
          await Future.delayed(const Duration(seconds: 1));
          popularController.setAddToCart = false;

        },
        child: Container(
          padding: EdgeInsets.all(Dimensions.heightDynamic(20)),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(
              Dimensions.heightDynamic(20),
            ),
          ),
          child: popularController.isAddToCart ? SizedBox(
            height: Dimensions.heightDynamic(25),
            width: Dimensions.heightDynamic(160),
                child: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ) :BigText(
            text:
                "\$${popularController.inCartItems == 0 ? product.price! : product.price! * popularController.inCartItems} | Add to cart",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
