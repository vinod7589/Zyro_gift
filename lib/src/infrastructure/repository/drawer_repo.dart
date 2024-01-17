import 'package:abc/src/infrastructure/dio/dio_api_service.dart';
import 'package:abc/src/model/drawer_model/my_card_model.dart';
import 'package:abc/src/model/drawer_model/transaction_history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DrawerRepoService {
  static Future<List<Transaction>?> getTransactionHistory(String query) async {
    try {
      final query = {
        'Page': 1,
        'PageSize': 10,
      };
      final body = {
        'SearchValue': query,
      };
      final response = await DioApiService.AuthPost(
          '/api/ZyroGiftVoucher/GetTransactionHistory', body,
          queryParameters: query);
      var res = TransactionsHistory.fromJson(response);
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

  static Future<List<MyCardList>?> myCard(String query, context) async {
    try {
      final query = {
        'Page': 1,
        'PageSize': 10,
      };
      final body = {
        'SearchValue': query,
      };

      final response = await DioApiService.AuthPost(
          '/api/ZyroGiftVoucher/GetAllVouchers', body,
          queryParameters: query);
      var res = MyCardModel.fromJson(response);
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
