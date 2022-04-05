import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/controllers/popular_product_controller.dart';
import 'package:mawsil/src/controllers/recommended_product_controller.dart';
import 'package:mawsil/src/repository/recommended_product_repo.dart';
import 'package:mawsil/src/services/api_client.dart';
import 'package:mawsil/src/services/app_urls.dart';
import 'package:mawsil/src/views/main_food_view/main_food_view.dart';
import 'src/repository/popular_product_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodView(),
    );
  }
}

Future<void> init() async{
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppUrls.BASE_URL));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendeProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendeProductRepo: Get.find()));
}
