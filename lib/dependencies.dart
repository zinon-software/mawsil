
import 'package:get/get.dart';

import 'src/controllers/popular_product_controller.dart';
import 'src/controllers/recommended_product_controller.dart';
import 'src/repository/popular_product_repo.dart';
import 'src/repository/recommended_product_repo.dart';
import 'src/services/api_client.dart';
import 'src/services/app_urls.dart';

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