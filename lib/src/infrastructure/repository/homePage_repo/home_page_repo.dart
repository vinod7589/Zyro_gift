import 'package:abc/src/model/homePage/amazing_fashion_model.dart';
import 'package:abc/src/model/homePage/beauty_budget_model.dart';
import 'package:abc/src/model/homePage/getbrand_details_model.dart';
import 'package:abc/src/model/homePage/new_brands_model.dart';
import 'package:abc/src/model/homePage/tripTravel_Model.dart';
import 'package:flutter/cupertino.dart';
import '../../../model/homePage/getAll_brand_list_model.dart';
import '../../../util/services/shared_preferences.dart';
import '../../dio/dio_api_service.dart';
import 'getAllPopularBrandsModel.dart';

class HomePageService {
  static Future<List<AllBrandList>?> getAllBrandListService(
      String payload) async {
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

  static Future<List<GetAllPopularBrandList>?> getAllPopularBrandsService(
      String payload) async {
    try {
      final response = await DioApiService.AuthPost(
        '/api/ZyroGiftVoucher/GetPopularBrand',
        {},
      );
      var res = GetAllPopularBrandListsModel.fromJson(response);
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

  static Future<List<TravelTrip>?> travelTripService(String payload) async {
    try {
      var request = {
        'Id': 7,
        'Page': '1',
        'PageSize': '4',
      };
      final body = {
        'SearchValue': request,
      };
      final response = await DioApiService.AuthPost(
          '/api/ZyroGiftVoucher/GetBrandByCategoryId', body,
          queryParameters: request);
      var res = TripTravelModel.fromJson(response);
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

  static Future<List<FashionList>?> fashionService(String payload) async {
    try {
      var request = {
        'Id': 5,
        'Page': '1',
        'PageSize': '7',
      };
      final body = {
        'SearchValue': request,
      };
      final response = await DioApiService.AuthPost(
          '/api/ZyroGiftVoucher/GetBrandByCategoryId', body,
          queryParameters: request);
      var res = FashionModel.fromJson(response);
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

  static Future<List<BeautyList>?> beautyService(String payload) async {
    try {
      var request = {
        'Id': 12,
        'Page': '1',
        'PageSize': '10',
      };
      final body = {
        'SearchValue': request,
      };
      final response = await DioApiService.AuthPost(
          '/api/ZyroGiftVoucher/GetBrandByCategoryId', body,
          queryParameters: request);
      var res = BeautyListModel.fromJson(response);
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

  static Future<List<NewBrandList>?> newBrandListService(String payload) async {
    try {
      final response =
          await DioApiService.AuthPost('/api/ZyroGiftVoucher/GetNewBrand', {});
      var res = GetAllNewBrandListModel.fromJson(response);
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

  static Future<GetBrandDetailsList?> getBrandDetailsService(
      String brandCode) async {
    try {
      var query = {
        'BrandCode': brandCode,
      };
      final response = await DioApiService.AuthPost(
          '/api/ZyroGiftVoucher/GetBrandDetailsViaBrandCode?BrandCode=$brandCode',
          queryParameters: query,
          {});
      var res = GetBrandDetailsModel.fromJson(response);
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
}
