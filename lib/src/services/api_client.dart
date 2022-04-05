import 'package:get/get.dart';

import 'urls.dart';

class ApiClient extends GetConnect implements GetxService {

  late String token = "";
  final String appBaseUrl ;

  late Map<String, String> _mainHeaders;


  ApiClient({ required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 20);
    _mainHeaders = {
      "Authorization":"Bearer $token",
      "Content-type":"application/json; charset=UTF-8",
    };
  }

  Future<Response> getData(String uri)async{
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    } 
  }
  
}

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppUrls.POPULAR_PRODUCTE_URL);
  }
}