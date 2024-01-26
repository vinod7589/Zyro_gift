import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../testfile/custom_keyboard.dart';
import '../infrastructure/repository/homePage_repo/getAllPopularBrandsModel.dart';
import '../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../model/homePage/amazing_fashion_model.dart';
import '../model/homePage/beauty_budget_model.dart';
import '../model/homePage/entertainment_model.dart';
import '../model/homePage/getall_categories_model.dart';
import '../model/homePage/getbrand_details_model.dart';
import '../model/homePage/new_brands_model.dart';
import '../model/homePage/tripTravel_Model.dart';
import '../view/Utility/constants.dart';
import '../view/mobile_view/home_page/home_items_page/card_details_page.dart';
import '../view/mobile_view/home_page/home_items_page/pofile/test_file.dart';
import '../view/mobile_view/home_page/home_page.dart';
import '../view/mobile_view/home_page/widget/Home_globalPage.dart';
import '../view/mobile_view/home_page/widget/denomination_select_widget.dart';
import 'fixed_card_controller.dart';

final HomePageController =
    ChangeNotifierProvider.family<homePageController, String>((ref, brandCode) {
  return homePageController((ref.read), brandCode: brandCode);
});

class homePageController extends ChangeNotifier {
  homePageController(this._reader, {required this.brandCode}) {
    allCategories();
    travelTrip();
    NewBrand();
    fashion();
    beauty();
    entertainment();
    getPopularBrands();
    _init();
  }
  final Reader _reader;
  final String brandCode;

  TextEditingController numKeyboardTextEditingController =
      TextEditingController();
  TextEditingController searchBarTextEditingController =
      TextEditingController();

  List<GetAllPopularBrandList> _allPopularBrands = [];
  List<GetAllPopularBrandList> get allPopularBrands => _allPopularBrands;

  List<CategoriesList> _categoriesList = [];
  List<CategoriesList> get categoriesList => _categoriesList;

  List<TravelTrip> _tripTravelList = [];
  List<TravelTrip> get tripTravelList => _tripTravelList;

  List<NewBrandList> _newBrandList = [];
  List<NewBrandList> get newBrandList => _newBrandList;

  List<FashionList> _fashionList = [];
  List<FashionList> get fashionList => _fashionList;

  List<BeautyList> _beautyList = [];
  List<BeautyList> get beautyList => _beautyList;

  List<EntertaimentList> _entertainmentList = [];
  List<EntertaimentList> get entertainmentList => _entertainmentList;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  GetBrandDetailsList? brandDetails;

  Future<void> allCategories() async {
    _isLoading = true;
    _categoriesList = await HomePageService.getAllCategoriesService() ?? [];
    _isLoading = false;

    print(_isLoading);
  }

  Future<void> travelTrip() async {
    _isLoading = true;
    _tripTravelList = await HomePageService.travelTripService() ?? [];
    _isLoading = false;
  }

  Future<void> NewBrand() async {
    _isLoading = true;
    _newBrandList = await HomePageService.newBrandListService("") ?? [];
    _isLoading = false;
  }

  Future<void> fashion() async {
    _isLoading = true;
    _fashionList = await HomePageService.fashionService() ?? [];
    _isLoading = false;
  }

  Future<void> beauty() async {
    _isLoading = true;
    _beautyList = await HomePageService.beautyService() ?? [];
    _isLoading = false;
  }

  Future<void> entertainment() async {
    _isLoading = true;
    _entertainmentList = await HomePageService.entertainmentService() ?? [];
    _isLoading = false;
  }

  Future<void> getPopularBrands() async {
    _isLoading = true;

    _allPopularBrands =
        await HomePageService.getAllPopularBrandsService() ?? [];
    log("dsfasefd$allPopularBrands");
    _isLoading = false;
    notifyListeners();
  }

  _init() async {
    brandDetails = await HomePageService.getBrandDetailsService(brandCode);
  }
}
