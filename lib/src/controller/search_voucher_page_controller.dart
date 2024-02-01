import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../model/homePage/getall_categories_model.dart';
import '../model/homePage/voucher_entity.dart';
import '../model/search/filtered_brand_model.dart';

// Provider for SearchVoucherPageController
final searchVoucherPageProvider =
    ChangeNotifierProvider<SearchVoucherPageController>((ref) {
  return SearchVoucherPageController(
    (ref.read),
  );
});

// Controller class for managing the state and logic of the search page
class SearchVoucherPageController extends ChangeNotifier {
  SearchVoucherPageController(
    this._read,
  ) {
    _initState();
  }

  final Reader _read;

  Future<void> _initState() async {
    _isLoading = true;
    await allCategories(); // Fetch all categories
    // await getAllVouchers();
    _isLoading = false;
  }
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  TextEditingController searchBarTextEditingController =
      TextEditingController();

  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<VoucherEntity> allPopularBrands = [];
  List<CategoriesList> categoriesList = [];
  List<VoucherEntity> tripTravelList = [];
  List<VoucherEntity> newBrandList = [];
  List<VoucherEntity> fashionList = [];
  List<VoucherEntity> beautyList = [];
  List<VoucherEntity> entertainmentList = [];
  HomePageService homeRepo = HomePageService();

  Future<void> allCategories() async {
    categoriesList = await homeRepo.getAllCategoriesService() ?? [];
    notifyListeners();
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
