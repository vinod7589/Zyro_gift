import 'package:abc/src/model/payment/check_payment_status_model.dart';
import 'package:abc/src/model/payment/payment_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/payment/purchasegift_voucher_model.dart';
import '../dio/dio_api_service.dart';

class PaymentRepo {
  DioApiService dio = DioApiService();

  Future<PaymentModel> paymentService(num payableAmount) async {
    try {
      var request = {
        "amount": payableAmount,
        "mode": "INTENT",
        "vpa": "",
        "customer_email": "test@example.com"
      };
      final response =
          await dio.AuthPost('/api/PaymentGateway/Initiate', request);
      var res = PaymentModel.fromJson(response);
      return res;
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
      return PaymentModel();
    }
  }

  Future<CheckPaymentStatusModel> checkPaymentStatus(
      String merchantTransactionId) async {
    try {
      var query = {
        'Merchant_Transaction_Id': merchantTransactionId,
      };
      final response = await dio.AuthPost(
          '/api/PaymentGateway/CheckPaymentStatus', {},
          queryParameters: query);
      var res = CheckPaymentStatusModel.fromJson(response);
      return res;
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
      return CheckPaymentStatusModel();
    }
  }

  Future<PurchaseGiftVoucherModel> purchaseGiftVoucherService(
      dynamic request) async {
    try {
      final response = await dio.AuthPost(
          '/api/ZyroGiftVoucher/PurchaseGiftVoucher', request);
      var res = PurchaseGiftVoucherModel.fromJson(response);
      return res;
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
      return PurchaseGiftVoucherModel();
    }
  }
}
