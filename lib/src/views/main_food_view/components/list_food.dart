import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mawsil/routes.dart';
import '../../../controllers/recommended_product_controller.dart';
import '../../../models/product_model.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/dimensions.dart';
import '../../../widgets/icon_and_text/icon_and_text_widget.dart';
import '../../../widgets/text/big_text_widget.dart';
import '../../../widgets/text/small_text_widget.dart';

class ListFoodMainView extends StatelessWidget {
  const ListFoodMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedProductController>(
        builder: (recommendedProducts) {
      return !recommendedProducts.isLoaded
          ? Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).textTheme.headline1!.color!,
                size: 45.0,
              ),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProducts.recommendeProductList.length,
              itemBuilder: (context, index) {
                ProductModel recommendedProduct =
                    recommendedProducts.recommendeProductList[index];
                return GestureDetector(
                  onTap: () => Get.toNamed(
                    RouteHelper.getRrecommendedFood(index),
                    arguments: {
                      "product": recommendedProduct,
                      "page": 'main-food-page',
                    },
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.heightDynamic(20),
                        right: Dimensions.heightDynamic(20),
                        bottom: Dimensions.heightDynamic(10)),
                    child: Row(
                      children: [
                        // image section

                        CachedNetworkImage(
                          maxHeightDiskCache:
                              Dimensions.heightDynamic(150).toInt(),
                          maxWidthDiskCache:
                              Dimensions.heightDynamic(150).toInt(),
                          imageUrl: recommendedProduct.img!,
                          imageBuilder: (context, imageProvider) => Container(
                            height: Dimensions.heightDynamic(120),
                            width: Dimensions.heightDynamic(120),
                            decoration: BoxDecoration(
                              color: index.isEven
                                  ? Colors.orange
                                  : const Color(0xFF9294cc),
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
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color:
                                  Theme.of(context).textTheme.headline1!.color!,
                              size: 25.0,
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(
                              Icons.hide_image_outlined,
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: recommendedProduct.name ??
                                        "Nutritious fruit meal is china",
                                  ),
                                  SizedBox(
                                    height: Dimensions.heightDynamic(8),
                                  ),
                                  SmallText(
                                    text: "With chinese charactristics",
                                  ),
                                  SizedBox(
                                    height: Dimensions.heightDynamic(8),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndText(
                                          icon: Icons.circle_sharp,
                                          iconColor: AppColors.iconColor1,
                                          text: "Normal"),
                                      IconAndText(
                                          icon: Icons.location_on,
                                          iconColor: AppColors.mainColor,
                                          text: "1.7km"),
                                      IconAndText(
                                          icon: Icons.access_time_rounded,
                                          iconColor: AppColors.iconColor2,
                                          text: "32"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
