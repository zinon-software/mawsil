import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/routes.dart';
import 'package:mawsil/src/controllers/popular_product_controller.dart';
import 'package:mawsil/src/controllers/recommended_product_controller.dart';
import 'package:mawsil/src/views/main_food_view/main_food_view.dart';
import 'dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendeProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const MainFoodView(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}

