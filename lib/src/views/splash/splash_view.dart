import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/routes.dart';
import 'package:mawsil/src/utilities/app_colors.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  void _loadResource() async {
   await Get.find<PopularProductController>().getPopularProductList();
   await Get.find<RecommendedProductController>().getRecommendeProductList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadResource();

    Timer(Duration(seconds: 3), ()=> Get.offAllNamed(RouteHelper.getHomePage));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
    );
  }

}