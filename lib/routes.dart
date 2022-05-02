import 'package:get/get.dart';
import 'package:mawsil/src/views/cart/cart_view.dart';
import 'package:mawsil/src/views/home/home_view.dart';
import 'package:mawsil/src/views/splash/splash_view.dart';
import 'src/controllers/cart_controller.dart';
import 'src/controllers/popular_product_controller.dart';
import 'src/views/food/popular_food_detail_view.dart';
import 'src/views/food/recommended_food_detail_view.dart';


class RouteHelper {
  static const String _splashPage = "/splash-page";
  static const String _homePage = "/";
  static const String _popularFoodPage = "/popular-food";
  static const String _recommendedFoodPage = "/recommended-food";
  static const String _cartPage = "/cart-page";

  static String get getSplashPage => _splashPage;
  static String get getHomePage => _homePage;
  static String getPopularFoodPage(int pageId) => "$_popularFoodPage?pageId=$pageId";
  static String getRrecommendedFoodPage(int pageId) => "$_recommendedFoodPage?pageId=$pageId";
  static String get getCartPage => _cartPage;


  static List<GetPage> routes = [
    GetPage(name: _splashPage, page: () => const SplashView()),
    GetPage(name: _homePage, page: () => const HomeView()),
    GetPage(
        name: _popularFoodPage,
        page: () {
          Get.find<PopularProductController>()
        .initProduct(Get.arguments["product"], Get.find<CartController>());
          return const PopularFoodDetailView();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: _recommendedFoodPage,
        page: () {
          Get.find<PopularProductController>()
        .initProduct(Get.arguments["product"], Get.find<CartController>());
          return const RecommendedFoodDetailView();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: _cartPage,
        page: () => const CartView(),
        transition: Transition.fadeIn),
  ];
}
