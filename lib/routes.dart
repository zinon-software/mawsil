import 'package:get/get.dart';
import 'package:mawsil/src/views/cart/cart_view.dart';
import 'src/views/food/popular_food_detail_view.dart';
import 'src/views/food/recommended_food_detail_view.dart';
import 'src/views/main_food_view/main_food_view.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String get getInitial => initial;
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRrecommendedFood(int pageId) => "$recommendedFood?pageId=$pageId";
  static String get getCartPage => cartPage;


  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFoodView()),
    GetPage(
        name: popularFood,
        page: () => const PopularFoodDetailView(),
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () => const RecommendedFoodDetailView(),
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () => const CartView(),
        transition: Transition.fadeIn),
  ];
}
