import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../util/services/shared_preferences.dart';

final dio = Dio();

class DioApiService {
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);
    Response response;
    response = await dio.get(url.toString());

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.data);
      return jsonResponse;
    } else {
      log(response.toString());
      // print(response);
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic body) async {
    final url = Uri.parse(baseUrl + endpoint);
    dio.interceptors.add(PrettyDioLogger(responseBody: true, requestBody: true

        // onRequest: (options, handler) {
        //   log('REQUEST: ${options.method} ${options.uri}');
        //   return handler.next(options);
        // },
        // onResponse: (response, handler) {
        //   log('RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
        //   return handler.next(response);
        // },
        ));
    //dio.options.headers['Authorization'] = 'Bearer your_token_here';
    dio.options.headers['Content-Type'] = 'application/json';
    final response = await dio.post(url.toString(), data: body);
    print(response);
    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 400) {
      print('Bad request');
      log('Response body: ${response.data}');
      // print('Response body: ${response.data}');
      return response.data;
    } else {
      print('Request successful');
      log('Response body: ${response.data}');
      // print('Response body: ${response.data}');
      return response.data;
    }
  }

  static Future<Map<String, dynamic>> AuthPost(String endpoint, dynamic body,
      {Map<String, dynamic>? queryParameters}) async {
    final url = Uri.parse(baseUrl + endpoint);

    dio.interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true
        // onRequest: (options, handler) {
        //   log('REQUEST: ${options.method} ${options.uri}');
        //   return handler.next(options);
        // },
        // onResponse: (response, handler) {
        //   // log('RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
        //   return handler.next(response);
        // },
        ));

    dio.options.headers['Authorization'] = 'bearer ' + UserPreferences.tokenId;
    dio.options.headers['Content-Type'] = 'application/json';
    final response = await dio.post(url.toString(),
        queryParameters: queryParameters, data: body);
    // log(response.toString());

    if (response.statusCode == 200) {
      return response.data;
    } else if (response.statusCode == 400) {
      log('Bad request');
      log('Response body: ${response.data}');
      return response.data;
    } else {
      log('Request successful');
      log('Response body: ${response.data}');
      return response.data;
    }
  }

  // // static Future<ImageUploadResponse> uploadImage(
  // //     File imageFile, String endpoint) async {
  // //   try {
  // //     // Create a Dio instance
  // //
  // //     final url = Uri.parse(constants.baseUrl + endpoint);
  // //
  // //     debugPrint("URL OF MAGE UPLOAD : " + url.toString());
  // //
  // //     String token = await construct_token();
  // //
  // //     dio.options.headers['Authorization'] = 'bearer $token';
  // //
  // //     var abc = imageFile.path;
  // //
  // //     debugPrint(abc);
  // //
  // //     FormData formData = FormData.fromMap({
  // //       'file': await MultipartFile.fromFile(imageFile.path,
  // //           filename: imageFile.path.split('\\').last),
  // //     });
  // //
  // //     print(formData);
  // //
  // //     print(formData.toString());
  // //
  // //     // Send a POST request to the API endpoint
  // //     var res = await dio.post(url.toString(), data: formData);
  // //
  // //     var response = ImageUploadResponse.fromJson(res.data);
  // //
  // //     print(response);
  // //
  // //     print('Image uploaded successfully');
  // //
  // //     return response;
  // //   } catch (error) {
  // //     print('Error uploading image: $error');
  // //     print(error);
  // //     return ImageUploadResponse(data: '');
  // //   }
  // }
}
