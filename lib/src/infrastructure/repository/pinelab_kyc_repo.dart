import 'package:abc/src/infrastructure/dio/dio_api_service.dart';
import 'package:abc/src/model/pinelab_kyc_model/pinelab_kyc_token_generate_model.dart';
import 'package:abc/src/model/pinelab_kyc_model/pinelab_minkyc_model.dart';
import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:flutter/widgets.dart';

import '../../model/pinelab_kyc_model/pinelab_fullkyc_model.dart';

// final pineLabKycRepository = Provider<PineLabKycRepository>((ref) {
//   return PineLabKycRepository()
// });
//
// class PineLabKycRepository {
//   PineLabKycRepository(this._read);
//
//   final Reader _read;
// }

class PineLabKycRepo {
  DioApiService dio = DioApiService();

  Future<PineLabKycTokenGenerateModel?> pineLabKycTokenGenerateRepo() async {
    PineLabKycTokenGenerateModel? res;
    try {
      final response = await dio.pineLabPost('/api/PineLabKyc/AcessToken', {});
      res = PineLabKycTokenGenerateModel.fromJson(response);
      if (res.success == true) {
        UserPreferences.setPineLabToken(
            pineLabToken: res.data!.token.toString());
      } else {
        showToast(message: 'Something went wrong');
      }
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
    }
    return res;
  }

  Future<PineLabMinKycModel?> pineLabMinKycRepo(String fullName,
      String mobileNumber, String emailId, String walletId) async {
    PineLabMinKycModel? res;
    try {
      var request = {
        'customerName': fullName,
        'mobileNumber': mobileNumber,
        'email': emailId,
        'walletId': walletId,
      };
      final response =
          await dio.pineLabAuthPost('/api/PineLabKyc/InitiateMinKyc', request);
      res = PineLabMinKycModel.fromJson(response);
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
      if (res?.message == 'Failed') {}
    }
    return res;
  }

  Future<PineLabFullKycModel?> pineLabFullKycRepo(String fullName,
      String mobileNumber, String emailId, String walletId) async {
    PineLabFullKycModel? res;
    try {
      var request = {
        'customerName': fullName,
        'mobileNumber': mobileNumber,
        'email': emailId,
        'walletId': walletId,
      };
      final response =
          await dio.pineLabAuthPost('/api/PineLabKyc/InitiateFullKyc', request);
      res = PineLabFullKycModel.fromJson(response);
    } catch (error, st) {
      debugPrint(error.toString());
      debugPrintStack(stackTrace: st);
    }
    return res;
  }
}
