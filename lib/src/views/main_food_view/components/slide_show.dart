import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mawsil/src/utilities/dimensions.dart';
import 'package:mawsil/src/widgets/icon_and_text/icon_and_text_widget.dart';
import 'package:mawsil/src/widgets/text/big_text_widget.dart';
import 'package:mawsil/src/widgets/text/small_text_widget.dart';

import '../../../utilities/app_colors.dart';

class SlideShowMainView extends StatefulWidget {
  const SlideShowMainView({Key? key}) : super(key: key);

  @override
  State<SlideShowMainView> createState() => _SlideShowMainViewState();
}

class _SlideShowMainViewState extends State<SlideShowMainView> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  // final double _height = Dimensions.pageViewContainer;
  final double _height = Dimensions.height(220);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController.addListener(
        () => setState(() => _currPageValue = pageController.page!));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.height(320),
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (BuildContext context, int position) =>
                _buildPageItem(position),
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            // height: Dimensions.pageViewContainer,
          height: Dimensions.height(220),

            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              color: index.isEven ? Colors.orange : const Color(0xFF9294cc),
              borderRadius: BorderRadius.circular(30),
              // image: DecorationImage(image: AssetImage(""),
              // fit: BoxFit.cover,),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: Dimensions.pageViewTextContainer,
              height:  Dimensions.height(120),
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.buttonBackgroundColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height(15), left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(
                      height: Dimensions.height(10)
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        const SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 10),
                        SmallText(text: "1287"),
                        const SizedBox(width: 10),
                        SmallText(text: "comments"),
                      ],
                    ),
                     SizedBox(
                      height: Dimensions.height(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
