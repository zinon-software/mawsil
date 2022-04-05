// import 'package:http/http.dart' as http;

// class BaseClient {
//   Map<String, String> headers = {
//     "": "",
//     "": "",
//   };

//   Future<dynamic> get({required apiUrl}) async {
//     Uri url = Uri.parse(apiUrl);
//     try {
//       http.Response response = await http
//           .get(url, headers: headers)
//           .timeout(const Duration(seconds: 20));

//       return _processResponse(response);
//     } catch (e) {}
//   }

//   static dynamic _processResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         break;
//       default:
//     }
//   }
// }
