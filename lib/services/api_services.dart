import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_kag/services/api_endpoint.dart';

// enum APIMethod { get, post }

// class ApiServices {
//   static var client = http.Client();

//   static Future api(
//       {required String endPoint,
//       required String type,
//       String param = "",
//       bool withToken = true,
//       var requestBodyMap = const {}}) async {
//     Map<String, String> headers;

//     headers = {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//     };

//     if (withToken) {
//       final box = GetStorage();
//       var token = box.read('token');
//       headers.addAll({
//         'Authorization': 'Bearer ${token}',
//       });
//     }
//     print('REQUEST BODY ${jsonEncode(requestBodyMap)}');

//     var response;
//     if (type == APIMethod.post) {
//       response = await client.post(
//         Uri.parse('$kBaseUrl$endPoint$param'),
//         headers: headers,
//         body: requestBodyMap.toString().isNotEmpty
//             ? jsonEncode(requestBodyMap)
//             : null,
//       );
//     } else if (type == APIMethod.get) {
//       response = await client.get(
//         Uri.parse('$kBaseUrl$endPoint$param'),
//         headers: headers,
//       );
//     }

//     print('URL PARSE == ${Uri.parse('$kBaseUrl$endPoint$param')}');
//     print("$endPoint RESPONSE BODY  == ${response.body}");

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       print('ERROR SERVICES ${json.decode(response.body)}');
//       return jsonDecode(response.body);
//     }
//   }
// }

enum APIMethod {
  get,
  post,
}

class ApiServices {
  static var client = http.Client();

  static Future api(
      {required String endPoint,
      required APIMethod type,
      String param = "",
      bool withToken = true,
      var requestBodyMap = const {}}) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (withToken) {
      final box = GetStorage();
      var token = box.read('token');
      headers.addAll(
        {'Authorization': 'Bearer ${token}'},
      );
    }

    print('REQURST BODY ${jsonEncode(requestBodyMap)}');

    var response;
    if (type == APIMethod.get) {
      response = await client.get(
        Uri.parse('$kBaseUrl$endPoint$param'),
        headers: headers,
      );
    } else {
      response = await client.post(
        Uri.parse('$kBaseUrl$endPoint$param'),
        headers: headers,
        body: requestBodyMap.toString().isNotEmpty
            ? jsonEncode(requestBodyMap)
            : null,
      );
    }

    print('URL PARSE ${Uri.parse('$kBaseUrl$endPoint$param')}');
    print('$endPoint RESPONSE BODY ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('error api sercies ${jsonDecode(response.body)}');
      return jsonDecode(response.body);
    }
  }
}
