import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes.dart';
import '../../../controllers/popular_product_controller.dart';
import '../../../models/product_model.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/dimensions.dart';
import '../../../widgets/column.dart';

class SlideShowMainView extends StatefulWidget {
  const SlideShowMainView({Key? key}) : super(key: key);

  @override
  State<SlideShowMainView> createState() => _SlideShowMainViewState();
}

class _SlideShowMainViewState extends State<SlideShowMainView> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.widthDynamic(210);

  @override
  void initState() {
    super.initState();

    pageController.addListener(
        () => setState(() => _currPageValue = pageController.page!));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slide show page
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return !popularProducts.isLoaded
              ? CircularProgressIndicator(
                  color: AppColors.mainColor,
                )
              : SizedBox(
                  height: Dimensions.widthDynamic(300),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (BuildContext context, int position) =>
                        _buildPageItem(position,
                            popularProducts.popularProductList[position]),
                  ),
                );
        }),
        // dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.heightDynamic(5.0))),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return GestureDetector(
      onTap: () => Get.toNamed(RouteHelper.getPopularFood(index)),
      child: Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.widthDynamic(210),
              margin: EdgeInsets.only(
                  left: Dimensions.heightDynamic(5),
                  right: Dimensions.heightDynamic(5)),
              decoration: BoxDecoration(
                color: index.isEven ? Colors.orange : const Color(0xFF9294cc),
                borderRadius:
                    BorderRadius.circular(Dimensions.heightDynamic(30)),
                image: DecorationImage(
                  image: NetworkImage(popularProduct.img!),
                  // image: DecorationImage(image: AssetImage("assets/image/food.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // height: Dimensions.pageViewTextContainer,
                height: Dimensions.widthDynamic(110),
                margin: EdgeInsets.only(
                    left: Dimensions.heightDynamic(30),
                    right: Dimensions.heightDynamic(30),
                    bottom: Dimensions.heightDynamic(30)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.buttonBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFe8e8e8),
                        blurRadius: Dimensions.heightDynamic(5.0),
                        offset: const Offset(0, 5),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0),
                      )
                    ]),
                child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.widthDynamic(8),
                      left: Dimensions.heightDynamic(15),
                      right: Dimensions.heightDynamic(15),
                    ),
                    child: AppColumn(
                      popularProduct: popularProduct,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
