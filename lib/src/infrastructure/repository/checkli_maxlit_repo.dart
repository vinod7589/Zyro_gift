import 'package:flutter/cupertino.dart';

import '../../model/checkmax_limit_reached_Model.dart';
import '../dio/dio_api_service.dart';

class CheckMaxLimitRepo {
  static Future<num?> getCheckLimitService(String brandCode) async {
    try {
      var query = {
        'BrandCode': brandCode,
      };
      final response = await DioApiService.AuthPost(
          '/api/DashBoard/CheckMaxLimitReached', queryParameters: query, {});
      var res = CheckMaxLimitReachedModel.fromJson(response);
      if (res.status == 'success') {
        return res.availableLimit;
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
