
import 'package:get/get.dart';

import '../services/api_client.dart';
import '../services/app_urls.dart';

class RecommendeProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendeProductRepo({required this.apiClient});

  Future<Response> getRecommendeProductList() async{
    return await apiClient.getData(AppUrls.RECOMMENDED_PRODUCTE_URL);
  }
}