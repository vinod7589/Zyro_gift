import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../infrastructure/repository/homePage_repo/getAllPopularBrandsModel.dart';
import '../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../model/homePage/amazing_fashion_model.dart';
import '../model/homePage/beauty_budget_model.dart';
import '../model/homePage/entertainment_model.dart';
import '../model/homePage/getall_categories_model.dart';
import '../model/homePage/getbrand_details_model.dart';
import '../model/homePage/new_brands_model.dart';
import '../model/homePage/tripTravel_Model.dart';

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

  bool _isLoadingFalse = false;
  bool get isLoadingFalse => _isLoadingFalse;

  GetBrandDetailsList? brandDetails;

  Future<void> allCategories() async {
    _categoriesList = await HomePageService.getAllCategoriesService() ?? [];

    print(_isLoading);
  }

  Future<void> travelTrip() async {
    _tripTravelList = await HomePageService.travelTripService() ?? [];
  }

  Future<void> NewBrand() async {
    _newBrandList = await HomePageService.newBrandListService("") ?? [];
  }

  Future<void> fashion() async {
    _fashionList = await HomePageService.fashionService() ?? [];
  }

  Future<void> beauty() async {
    _beautyList = await HomePageService.beautyService() ?? [];
  }

  Future<void> entertainment() async {
    _entertainmentList = await HomePageService.entertainmentService() ?? [];
  }

  Future<void> getPopularBrands() async {
    _isLoading = true;
    _allPopularBrands =
        await HomePageService.getAllPopularBrandsService() ?? [];
    log("dsfasefd$allPopularBrands");
    notifyListeners();
    _isLoading = false;
  }

  _init() async {
    brandDetails = await HomePageService.getBrandDetailsService(brandCode);
  }
}
