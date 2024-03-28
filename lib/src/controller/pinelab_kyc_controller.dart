import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/widgets/dialogs/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../infrastructure/repository/pinelab_kyc_repo.dart';
import '../model/pinelab_kyc_model/pinelab_fullkyc_model.dart';
import '../model/pinelab_kyc_model/pinelab_kyc_token_generate_model.dart';
import '../view/mobile_view/card_page/kyc_page/kyc_user_details_page.dart';

final pineLabController =
    ChangeNotifierProvider.autoDispose<PineLabController>((ref) {
  return PineLabController((ref.read));
});

class PineLabController extends ChangeNotifier {
  PineLabController(this._read);

  final Reader _read;

  /// ///////////////// <-TextEditingController-> /////////////////
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController emailIdTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController stateTextEditingController = TextEditingController();
  TextEditingController pinCodeTextEditingController = TextEditingController();

  /// ///////////////// <-formKey-> /////////////////
  final formKey = GlobalKey<FormState>();

  String _selectedValue = '';
  bool _minKycChecked = true;
  bool _fullKycChecked = false;

  bool _isLoading = false;

  bool get minKycChecked => _minKycChecked;

  bool get fullKycChecked => _fullKycChecked;

  bool get isLoading => _isLoading;

  String get selectedValue => _selectedValue;

  void changeMinKycChecked(bool isEnabled) {
    _minKycChecked = isEnabled;
    _fullKycChecked = false;
    notifyListeners();
    if (kDebugMode) {
      print('minKyc: ${_minKycChecked.toString()}');
    }
  }

  void changeFullKycChecked(bool isEnabled) {
    _fullKycChecked = isEnabled;
    _minKycChecked = false;
    notifyListeners();
    if (kDebugMode) {
      print('fullKyc: ${_fullKycChecked.toString()}');
    }
  }
}
