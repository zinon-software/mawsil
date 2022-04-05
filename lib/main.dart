import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawsil/src/controllers/popular_product_controller.dart';
import 'package:mawsil/src/services/api_client.dart';
import 'package:mawsil/src/services/urls.dart';
import 'package:mawsil/src/views/food/recommended_food_detail.dart';
import 'package:mawsil/src/views/main_food_view/main_food_view.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodView(),
      // home: const RecommendedFoodDetail(),
      // home: const PopularFoodDetail(),
    );
  }
}

Future<void> init() async{
  Get.lazyPut(() => ApiClient(appBaseUrl: AppUrls.BASE_URL));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
