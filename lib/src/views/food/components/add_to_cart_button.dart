import 'package:flutter/material.dart';
import 'package:mawsil/src/controllers/popular_product_controller.dart';
import 'package:mawsil/src/models/product_model.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/dimensions.dart';
import '../../../widgets/icon/app_icon.dart';
import '../../../widgets/text/big_text_widget.dart';

class AddToCartFoodView extends StatelessWidget {
  final ProductModel product;
  final PopularProductController popularController;
  const AddToCartFoodView(
      {Key? key, required this.product, required this.popularController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
