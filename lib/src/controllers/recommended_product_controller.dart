import 'package:get/get.dart';
import '../models/popular_product_model.dart';
import '../repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendeProductRepo recommendeProductRepo;
  RecommendedProductController({required this.recommendeProductRepo});
  List<dynamic> _recommendeProductList = [];
  List<dynamic> get recommendeProductList => _recommendeProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendeProductList() async{
    Response response = await recommendeProductRepo.getRecommendeProductList();
    if (response.statusCode == 200) {
      _recommendeProductList = [];
      _recommendeProductList.addAll(Product.fromJson(response.body).getProducts);
      _isLoaded=true;
      update();
    } else {

    }
  }

  int _quantity = 0;

  int get quantity => _quantity;

  void setQuantity (bool isIncrement){
    if (isIncrement) {
      _quantity++;
    } else {
      _quantity--;
    }
    update();
  }
  
}
