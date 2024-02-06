import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../model/homePage/getall_categories_model.dart';
import '../model/homePage/voucher_entity.dart';
import '../model/search/filtered_brand_model.dart';

// Provider for SearchPagePaginationController
final searchPagePaginationProvider =
    ChangeNotifierProvider<SearchPagePaginationController>((ref) {
  return SearchPagePaginationController(
    (ref.read),
  );
});

// Controller class for managing the state and logic of the search page
class SearchPagePaginationController extends ChangeNotifier {
  SearchPagePaginationController(
    this._read,
  ) {
    _initState();
  }

  // Initialize the controller state
  void _initState() {
    _isLoading = true;
    allCategories(); // Fetch all categories
    getBrandByCategoryId(categoryId: "0", page: _page); // Fetch brands
    _isLoading = false;
    controller = ScrollController()..addListener(_loadMore);
  }

  // Service to interact with the home page data
  HomePageService homeRepo = HomePageService();

  final Reader _read;
  TextEditingController searchBarTextEditingController =
      TextEditingController();
  String _searchQuery = "";
  String get searchQuery => _searchQuery;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Index for the selected category and brand
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  int _selectedCategoryId = 0;
  int get selectedCategoryId => _selectedCategoryId;

  List<VoucherEntity> _filteredBrandList = [];
  List<VoucherEntity> get filteredBrandList => _filteredBrandList;
  List<CategoriesList> categoriesList = [];

  // Fetch all categories
  Future<void> allCategories() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if(prefs.getString('cat_data') != null && prefs.getString('cat_data') != ''){
    //   categoriesList= List<CategoriesList>.from(prefs.getString('cat_data'));
    // }
    categoriesList = await homeRepo.getAllCategoriesService() ?? [];
    notifyListeners();
    // prefs.setString('cat_data', categoriesList.toString());
    // print("Cache data");
    // print(prefs.getString('cat_data')0 );
  }

  // Fetch brands based on category and page
  Future<void> getBrandByCategoryId(
      {required String categoryId, required int page}) async {
    _isLoading = true;
    notifyListeners();

    _filteredBrandList = await HomePageService().getBrandByCategoryId(
            categoryId: categoryId, page: page, query: searchQuery) ??
        [];
    _isLoading = false;

    notifyListeners();
  }

  // Scroll controller for handling scroll events
  late ScrollController controller;

  // Page and loading-related variables
  int _page = 1;
  bool _hasNextPage = true;

  bool _isFirstLoadRunning = false;
  bool get isFirstLoadRunning => _isFirstLoadRunning;

  bool _isFirstError = false;
  bool get isFirstError => _isFirstError;
  String _firstErrorMessage = '';
  String get firstErrorMessage => _firstErrorMessage;
  bool _isLoadMoreRunning = false;
  bool get isLoadMoreRunning => _isLoadMoreRunning;
  bool _isLoadMoreError = false;
  bool get isLoadMoreError => _isLoadMoreError;
  String _loadMoreErrorMessage = '';
  String get loadMoreErrorMessage => _loadMoreErrorMessage;

  // Select a category based on the index
  void selectCategory(int index) {
    _selectedCategoryId = categoriesList[index].id ?? 0;
    _selectedIndex = index;

    _firstLoad(); // Fetch data for the selected category
    notifyListeners();
  }

  // Perform a search based on the entered query
  void search() {
    _searchQuery = searchBarTextEditingController.text;
    selectCategory(0); // Select the first category after searching
    notifyListeners();
  }

  // Clear search and reset to initial state
  Future<void> searchClear() async {
    _isLoading = true;
    notifyListeners();
    searchBarTextEditingController.clear();
    search();
    _isLoading = false;

    notifyListeners();
  }

  // Fetch the initial set of data
  Future<void> _firstLoad() async {
    _page = 1;
    _isFirstLoadRunning = true;
    notifyListeners();

    try {
      // Fetch data for the selected category and page
      _filteredBrandList = await HomePageService().getBrandByCategoryId(
              categoryId: _selectedCategoryId.toString(),
              page: _page,
              query: searchQuery) ??
          [];

      if (_filteredBrandList.length < 500) {
        _hasNextPage = false;
      }

      notifyListeners();
    } on Exception catch (err) {
      _isFirstError = true;
      _firstErrorMessage = "Session Expired...";
    }

    _isFirstLoadRunning = false;
    notifyListeners();
  }

  // Load more data when scrolling near the bottom
  Future<void> _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        controller.position.extentAfter < 10) {
      _isLoadMoreRunning = true;
      notifyListeners();
      _page += 1;

      try {
        var list;
        list = await HomePageService().getBrandByCategoryId(
                categoryId: _selectedCategoryId.toString(),
                page: _page,
                query: searchQuery) ??
            [];

        if (list.isNotEmpty) {
          _filteredBrandList.addAll(list);
          notifyListeners();
        } else {
          _hasNextPage = false;
          notifyListeners();
        }
      } on Exception catch (err) {
        _loadMoreErrorMessage = "Something went wrong";
      }

      _isLoadMoreRunning = false;
      notifyListeners();
    }
  }

  // Scroll to the top of the list
  void scrollToTop() {
    controller.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  // Refresh the data by reverting to the initial state
  Future<void> refresh() async {
    _page = 1;
    _hasNextPage = true;
    _isFirstLoadRunning = false;
    _isFirstError = false;
    _firstErrorMessage = '';
    _isLoadMoreRunning = false;
    _isLoadMoreError = false;
    _loadMoreErrorMessage = '';
    _filteredBrandList = [];

    await _firstLoad();
  }

  // Dispose of the controller when it is no longer needed
  @override
  void dispose() {
    searchBarTextEditingController.clear();
    controller.removeListener(_loadMore);
    super.dispose();
  }
}
