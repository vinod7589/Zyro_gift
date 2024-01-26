import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../model/homePage/getbrand_details_model.dart';

final fixedCardController =
    ChangeNotifierProvider.family<FixedCardController, String>(
        (ref, brandCode) {
  return FixedCardController((ref.read), brandCode: brandCode);
});

class FixedCardController extends ChangeNotifier {
  FixedCardController(this._read, {required this.brandCode}) {
    _init();
  }

  final Reader _read;
  final String brandCode;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  GetBrandDetailsList? brandDetails;
  List<double> _denominationOption = [];
  Map<double, int> _denominationVariant = {};
  Map<double, int> get denominationVariant => _denominationVariant;
  double _totalCardWorth = 0;
  double get totalCardWorth => _totalCardWorth;

  List<double> get denominationOption => _denominationOption;

  _init() async {
    log("hitt");
    _isLoading = true;
    brandDetails = await HomePageService.getBrandDetailsService(brandCode);
    await getDenominationList();

    _isLoading = false;

    notifyListeners();
  }

  void addDenominationInCart(int index) {
    double amount = denominationOption[index];
    if (_denominationVariant.containsKey(amount)) {
      // If the value is already in the map, increment the count
      _denominationVariant[amount] = _denominationVariant[amount]! + 1;
    } else {
      // If the value is not in the map, add a new key with value 1
      _denominationVariant[amount] = 1;
    }
    calculateTotal();

    log(_denominationVariant.toString());
    notifyListeners();
  }

  void removeDenominationInCart(int index) {
    double amount = denominationOption[index];
    if (_denominationVariant.containsKey(amount)) {
      // If the value is already in the map, increment the count
      _denominationVariant[amount] = _denominationVariant[amount]! - 1;
    } else {
      _denominationVariant.remove(amount);
      // _denominationVariant[amount];
    }
    calculateTotal();
    log(_denominationVariant.toString());
    notifyListeners();
  }

  void calculateTotal() {
    _totalCardWorth = 0;
    _denominationVariant.forEach((key, value) {
      _totalCardWorth += key * value;
    });
    notifyListeners();
    // int quantity =  _denominationVariant[amount]??0;
    // _totalCardWorth= amount*quantity;
  }

  getDenominationList() async {
    String? denominationList = brandDetails?.denominationList;

    if (denominationList != null) {
      List<String> array = denominationList.split(',');
      _denominationOption = array.map((e) => double.tryParse(e) ?? 0).toList();
      print(_denominationOption);
    }
    notifyListeners();
  }
}
