import 'package:abc/src/infrastructure/dio/dio_api_service.dart';
import 'package:abc/src/model/drawer_model/My_carddetails_model.dart';
import 'package:abc/src/model/drawer_model/my_card_model.dart';
import 'package:abc/src/model/drawer_model/transaction_history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DrawerRepoService {
  DioApiService dio = DioApiService();

  Future<List<Transaction>?> getTransactionHistory(String query) async {
    try {
      final query = {
        'Page': 1,
        'PageSize': 10,
      };
      final body = {
        'SearchValue': query,
      };
      final response = await dio.AuthPost(
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

  Future<List<MyCardList>?> myCard(
    String searchvalue,
  ) async {
    try {
      final query = {
        'SearchValue': searchvalue,
      };

      final response = await dio.AuthPost(
          '/api/ZyroGiftVoucher/GetAllVouchers', {},
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

  Future<CardDetailsModel> cardDetailsServive(
    String orderId,
  ) async {
    try {
      final query = {
        'OrderId': orderId,
      };

      final response = await dio.AuthPost(
          '/api/ZyroGiftVoucher/GetVouchersDetailsByOrderId', {},
          queryParameters: query);
      var res = CardDetailsModel.fromJson(response);
      return res;
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
      return CardDetailsModel();
    }
  }
}
