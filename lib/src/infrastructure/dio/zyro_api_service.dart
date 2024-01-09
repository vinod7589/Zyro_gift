// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:abc/src/view/Utility/constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'encryptdecrypt.dart';
//
// class ZyroApiService {
//   static Future<Map<String, dynamic>> get(String endpoint) async {
//     final url = Uri.parse(baseUrl + endpoint);
//
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     } else {
//       print(response);
//       throw Exception('Failed to load data');
//     }
//   }
//
//   static Future<Map<String, dynamic>> post(
//       String endpoint, dynamic body) async {
//     final url = Uri.parse(baseUrl + endpoint);
//
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(body),
//     );
//
//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     } else if (response.statusCode == 400) {
//       print('Bad request');
//       print('Response body: ${response.body}');
//       var jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     } else {
//       print('Request successful');
//       print('Response body: ${response.body}');
//       var jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     }
//   }
//
//   static Future<Map<String, dynamic>> AuthPost(
//       String endpoint, dynamic body) async {
//     String token = await construct_token();
//
//     final url = Uri.parse(baseUrl + endpoint);
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'bearer ' + token
//       },
//       body: json.encode(body),
//     );
//
//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     } else if (response.statusCode == 400) {
//       print('Bad request');
//       print('Response body: ${response.body}');
//       var jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     } else {
//       print('Request successful');
//       print('Response body: ${response.body}');
//       var jsonResponse = json.decode(response.body);
//       return jsonResponse;
//     }
//   }
//
//   static Future<String> construct_token() async {
//     try {
//       final SharedPreferences storage = await SharedPreferences.getInstance();
//
//       if (storage.containsKey('access_token') == true &&
//           storage.containsKey('user_info') == true) {
//         String accessToken = await storage.getString('access_token').toString();
//
//         String UserInfo = await storage.getString('user_info').toString();
//
//         var plain_token =
//             EncryptDecrpytService.DecryptStatic(data: accessToken);
//
//         var plain_info = EncryptDecrpytService.DecryptStatic(data: UserInfo);
//
//         print(plain_info);
//
//         print(plain_token);
//
//         return plain_token;
//       } else {
//         return "";
//       }
//     } catch (e) {
//       print(e);
//       return "";
//     }
//   }
// }
