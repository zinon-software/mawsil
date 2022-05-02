import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mawsil/src/controllers/cart_controller.dart';
import 'package:mawsil/src/models/cart_model.dart';
import 'package:mawsil/src/utilities/app_colors.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/icon/app_icon.dart';

import '../../../routes.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../widgets/text/big_text_widget.dart';
import '../../widgets/text/small_text_widget.dart';

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
                SizedBox(width: Dimensions.heightDynamic(20) * 5),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.getHomePage),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.heightDynamic(20),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.getCartPage),
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
          ),
          Positioned(
            top: Dimensions.heightDynamic(20) * 5,
            left: Dimensions.heightDynamic(20),
            right: Dimensions.heightDynamic(20),
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.heightDynamic(15)),
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: ((controller) => ListView.builder(
                        itemCount: controller.getItems.length,
                        itemBuilder: (context, index) {
                          CartModel cart = controller.getItems[index];
                          return Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Row(
                              children: [
                                // image section
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(cart.product!);

                                    if (popularIndex >= 0) {
                                      Get.toNamed(
                                        RouteHelper.getPopularFoodPage(
                                            popularIndex),
                                        arguments: {
                                          "product": cart.product,
                                          "page": 'cart-page',
                                        },
                                      );
                                    } else {
                                      var recommendeIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendeProductList
                                          .indexOf(cart.product!);
                                      Get.toNamed(
                                        RouteHelper.getRrecommendedFoodPage(
                                            recommendeIndex),
                                        arguments: {
                                          "product": cart.product,
                                          "page": 'cart-page',
                                        },
                                      );
                                    }
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: cart.img!,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: Dimensions.heightDynamic(120),
                                      width: Dimensions.heightDynamic(120),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.heightDynamic(10),
                                        ),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: LoadingAnimationWidget
                                          .staggeredDotsWave(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color!,
                                        size: 25.0,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                      child: Icon(
                                        Icons.hide_image_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color,
                                      ),
                                    ),
                                  ),
                                ), // text container
                                Expanded(
                                  child: Container(
                                    height: Dimensions.heightDynamic(100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(
                                            Dimensions.heightDynamic(20)),
                                        topRight: Radius.circular(
                                            Dimensions.heightDynamic(20)),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.heightDynamic(10),
                                          right: Dimensions.heightDynamic(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BigText(
                                              text: cart.name ??
                                                  "Nutritious fruit meal is china"),
                                          SizedBox(
                                              height:
                                                  Dimensions.heightDynamic(4)),
                                          SmallText(text: "Spicy"),
                                          SizedBox(
                                              height:
                                                  Dimensions.heightDynamic(4)),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                    color: Colors.red,
                                                    text:
                                                        "\$ ${cart.price!}",),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .buttonBackgroundColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: Dimensions
                                                                .heightDynamic(
                                                                    20) /
                                                            2,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () =>
                                                            controller.addItem(
                                                                cart.product!,
                                                                -1),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Dimensions
                                                                .heightDynamic(
                                                                    20) /
                                                            2,
                                                      ),
                                                      BigText(
                                                          text: cart.quantity
                                                              .toString()),
                                                      SizedBox(
                                                        width: Dimensions
                                                                .heightDynamic(
                                                                    20) /
                                                            2,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () =>
                                                            controller.addItem(
                                                                cart.product!,
                                                                1),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Dimensions
                                                                .heightDynamic(
                                                                    20) /
                                                            2,
                                                      ),
                                                    ],

                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.heightDynamic(8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                  )),
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
                child:
                    BigText(text: "\$ " + cartController.totalAmount.toString()),
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
                    text: "Check Out",
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
