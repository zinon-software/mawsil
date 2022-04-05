
import 'package:get/get.dart';

import '../services/api_client.dart';
import '../services/app_urls.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppUrls.POPULAR_PRODUCTE_URL);
  }
}