import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/repository/drawer_repo.dart';
import '../model/drawer_model/my_card_model.dart';

final myCardListPageProvider =
    ChangeNotifierProvider<MyCardListController>((ref) {
  return MyCardListController();
});

// Controller class for managing the state and logic of the search page
class MyCardListController extends ChangeNotifier {
  MyCardListController() {
    _initState();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<MyCardList> _myCardListItems = [];

  List<MyCardList> get myCardListItems => _myCardListItems;

  Future<void> _fetchCard() async {
    _isLoading = true;
    notifyListeners();

    _myCardListItems = await DrawerRepoService().myCard(
          "",
        ) ??
        [];
    print(_myCardListItems.toString());
    _isLoading = false;
    notifyListeners();
  }

  void refresh() {
    _initState();
  }

  Future<void> refreshFromInt() async {
    _myCardListItems = await DrawerRepoService().myCard(
          "",
        ) ??
        [];
    notifyListeners();
  }

  Future<void> _initState() async {
    notifyListeners();

    _fetchCard();
  }

// Future<void> getAllVouchers() async {
//   _isLoading = true;
//   var res = await homeRepo.getAllVoucher();
//   if (res.status == "success") {
//     allPopularBrands =
//         res.data!.where((item) => item.isPopularBrand == true).toList();
//     newBrandList =
//         res.data!.where((item) => item.isNewBrand == true).toList();
//     tripTravelList =
//         res.data!.where((item) => item.categoryId == 7).take(4).toList();
//
//     fashionList =
//         res.data!.where((item) => item.categoryId == 5).take(7).toList();
//     beautyList =
//         res.data!.where((item) => item.categoryId == 12).take(7).toList();
//     entertainmentList =
//         res.data!.where((item) => item.categoryId == 8).take(4).toList();
//   }
//   _isLoading = false;
//   notifyListeners();
// }
}
