import 'package:abc/src/infrastructure/dio/dio_api_service.dart';
import 'package:abc/src/model/pineLab_prepaidCard_model/pineLab_prepaidCardTransaction_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/pineLab_prepaidCard_model/pinelab_prepaidCard_details_model.dart';

class PineLabPrepaidCardRepo {
  DioApiService dio = DioApiService();

  Future<PrepaidCardDetailsModel?> prepaidCardDetailsService(
      String refNumber, String userId) async {
    PrepaidCardDetailsModel? res;
    try {
      var request = {
        'refNumber': refNumber,
        'walletId': userId,
      };
      final response = await dio.pineLabPost(
          '/api/PineLabPrepaidCard/GetCardDetails', request);
      res = PrepaidCardDetailsModel.fromJson(response);
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
    }
    return res;
  }

  Future<PrepaidCardTransactionHistoryModel?> prepaidCardTransactionService(
      String refNumber, String userId) async {
    PrepaidCardTransactionHistoryModel? res;
    try {
      var request = {
        "refNumber": refNumber,
        "walletId": userId,
      };
      final response = await dio.pineLabPost(
          '/api/PineLabPrepaidCard/CardTransactionHistory', request);
      res = PrepaidCardTransactionHistoryModel.fromJson(response);
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
    }
    return res;
  }
}
