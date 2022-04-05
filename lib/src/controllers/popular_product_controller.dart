import 'dart:developer';
import 'package:get/get.dart';
import 'package:mawsil/src/services/api_client.dart';

import '../models/popular_product_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
      log("response");
    if (response.statusCode == 200) {
      _popularProductList = [];
      log("response");
      log(response.body.toString());
      _popularProductList.addAll(Product.fromJson(response.body).getProducts);
      _isLoaded=true;
      update();
    } else {

    }
  }
}
