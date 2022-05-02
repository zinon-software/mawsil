import 'package:get/get.dart';

import '../utilities/functions.dart';

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
      Response response = await get(uri).timeout(Duration(seconds: 5));
      return response;
    } catch (e) {
      openDialog("TimeOut", message: e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    } 
  }
  
}
