import 'package:flutter/cupertino.dart';

import '../../../model/homePage/getAll_brand_list_model.dart';
import '../../../util/services/shared_preferences.dart';
import '../../dio/dio_api_service.dart';

class HomePageService {
  static Future<List<AllBrandList>?> getAllBrandList(String payload) async {
    try {
      var request = {
        'user_id': UserPreferences.userId,
        'Page': '1',
        'PageSize': '10',
        'SearchValue': '',
      };
      // final body = {
      //   'SearchValue': request,
      // };
      final response = await DioApiService.AuthPost(
        '/api/ZyroGiftVoucher/GetAllBrandWithPagination',
        request,
      );
      var res = GetAllBrandList.fromJson(response);
      if (res.status == 'success') {
        return res.data;
      } else {
        return null;
      }
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
      return null;
    }
  }

  // static Future<List<AllBrandList>?> getAllBrandList(String payload) async {
  //   try {
  //     var request = {
  //       'user_id': UserPreferences.userId,
  //       'Page': '',
  //       'PageSize': '',
  //     };
  //     final body = {
  //       'SearchValue': request,
  //     };
  //     final response = await DioApiService.AuthPost(
  //         '/api/ZyroGiftVoucher/GetAllBrandWithPagination', request);
  //     var res = GetAllBrandList.fromJson(response);
  //     if (res.status == 'success') {
  //       return res.data;
  //     } else {
  //       return null;
  //     }
  //   } catch (error, st) {
  //     debugPrint(error.toString());
  //     debugPrintStack(stackTrace: st);
  //     return null;
  //   }
  // }
}
