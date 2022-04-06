import 'package:get/get.dart';
import 'src/views/food/popular_food_detail_view.dart';
import 'src/views/food/recommended_food_detail_view.dart';
import 'src/views/main_food_view/main_food_view.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRrecommendedFood(int pageId) => "$recommendedFood?pageId=$pageId";


  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> const MainFoodView()),
    GetPage(name: popularFood, page: () {
      var pageId = Get.parameters["pageId"];
      return PopularFoodDetailView(pageId: int.parse(pageId!));
    }, transition: Transition.fadeIn),
    GetPage(name: recommendedFood, page: () {
      var pageId = Get.parameters["pageId"];
      return RecommendedFoodDetailView(pageId: int.parse(pageId!));
    }, transition: Transition.fadeIn),
  ];
}