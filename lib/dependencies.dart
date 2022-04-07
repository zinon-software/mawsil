
import 'package:get/get.dart';
import 'package:mawsil/src/controllers/cart_controller.dart';
import 'package:mawsil/src/repository/cart_repo.dart';

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
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendeProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}