import 'package:abc/src/model/homePage/price_list_model.dart';
import 'package:abc/src/model/homePage/all_categories_model.dart';
import 'package:abc/src/model/homePage/amazing_fashion_model.dart';
import 'package:abc/src/model/homePage/beauty_budget_model.dart';
import 'package:abc/src/model/homePage/new_brands_model.dart';
import 'package:abc/src/model/homePage/top_trending_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Packages/carousel_slider/carousel_controller.dart';
import '../../../../model/homePage/categories_model.dart';
import '../../../../model/homePage/entertainment_with _hot _deals_model.dart';
import '../../../../model/homePage/getAll_brand_list_model.dart';
import '../../../../model/homePage/gifting_and_love_model.dart';
import '../../../../model/homePage/popular_brands_model.dart';
import '../../../../model/homePage/save_your_routine_spends.dart';

final HomeGlobalPage =
    ChangeNotifierProvider.autoDispose<homeGlobalPAge>((ref) {
  return homeGlobalPAge(ref.read);
});

class homeGlobalPAge extends ChangeNotifier {
  homeGlobalPAge(this._reader);

  final Reader _reader;

  //{// .0 remove that
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  //}//
  List imageList = [
    {"id": 1, "image_path": 'assets/images/myntrabanner2.png'},
    {"id": 2, "image_path": 'assets/images/myntrabanner2.png'},
    {"id": 3, "image_path": 'assets/images/myntrabanner2.png'}
  ];
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;
  int _number = 0;
  int get number => _number;

  List<ProductBanner> bannerGridList = [
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/GLAM_STUDIO-2.png',
        productImages: 'assets/images/glam-studios-product.png',
        color1: Colors.black87.withOpacity(0.5),
        color2: Colors.pink.shade800,
        title: 'Zomato'),
    ProductBanner(
        discount: '10.5',
        companyImages: 'assets/images/apollo.png',
        productImages: 'assets/images/apollo-product-2.png',
        color1: Colors.black87.withOpacity(0.5),
        color2: Color(0xFF02D5A0),
        title: 'Uber'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/costa.png',
        productImages: 'assets/images/costa-product-image-1.png',
        color1: Colors.black87.withOpacity(0.5),
        color2: Color(0x4AFF0000),
        title: 'Amazon'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/Pizza_Hut-product.png',
        productImages: 'assets/images/pizza.png',
        color1: Colors.black87.withOpacity(0.5),
        color2: Colors.red.shade800,
        title: 'Zomato'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/bata.png',
        productImages: 'assets/images/bata-product.png',
        color1: Colors.black87.withOpacity(0.5),
        color2: Color.fromRGBO(191, 128, 64, 1.0),
        title: 'Bigbasket'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/kfc-2.png',
        productImages: 'assets/images/kfc-product-1.png',
        color1: Colors.black87.withOpacity(0.5),
        color2: Colors.red.shade600,
        title: 'Flipkart'),
  ];
  List<PopularBrands> redeemCode = [
    PopularBrands(
      discount: 'GET 4% OFF',
      companyImages: 'assets/images/uber2.png',
      code: 'FLYUBER4',
      color1: Color(0xFFEDEEF1),
      color2: Colors.black,
      title: 'Redeem',
    ),
    PopularBrands(
      discount: 'GET 5% OFF',
      companyImages: 'assets/images/chroma.png',
      code: 'BUYCROM5',
      color1: Color(0xFFE2F1EA),
      color2: Colors.black,
      title: 'Redeem',
    ),
    PopularBrands(
      discount: 'GET 3% OFF',
      companyImages: 'assets/images/zomato2.png',
      code: 'GETZO3',
      color1: Color(0xFFFDEBED),
      color2: Colors.black,
      title: 'Redeem',
    ),
    PopularBrands(
      discount: 'GET 2% OFF',
      companyImages: 'assets/images/bigbasket2.png',
      code: 'BIGFLY2',
      color1: Color(0xFFE7F2C9),
      color2: Colors.black,
      title: 'Redeem',
    ),
  ];
  List<CategoriesEntity> categories = [
    CategoriesEntity(
      title: 'Food',
      companyImages1: 'assets/images/Zomato_logo.jpg',
      companyImages2: 'assets/images/starbucks.png',
      productImages: 'assets/images/pizza1.png',
      color1: Color.fromRGBO(245, 245, 245, 1),
    ),
    CategoriesEntity(
      title: 'Travel',
      companyImages1: 'assets/images/uber.png',
      companyImages2: 'assets/images/yatra.png',
      productImages: 'assets/images/uberhand2.png',
      color1: Color.fromRGBO(245, 245, 245, 1),
    ),
    CategoriesEntity(
      title: 'Shopping',
      companyImages1: 'assets/images/amazon.png',
      companyImages2: 'assets/images/flipkart.png',
      productImages: 'assets/images/laptop.png',
      color1: Color.fromRGBO(245, 245, 245, 1),
    ),
    CategoriesEntity(
      title: 'Fashion',
      companyImages1: 'assets/images/myntra.png',
      companyImages2: 'assets/images/ajio.png',
      productImages: 'assets/images/myntra-girl.png',
      color1: Color.fromRGBO(245, 245, 245, 1),
    ),
  ];

  List<AllCategorysList> allCategoriesList = [
    AllCategorysList(
        title: 'All Brands', categoriesImage: 'assets/images/allBrands.png'),
    AllCategorysList(title: 'Food', categoriesImage: 'assets/images/foods.png'),
    AllCategorysList(
        title: 'Grocery', categoriesImage: 'assets/images/grocery.png'),
    AllCategorysList(
        title: 'Fashion', categoriesImage: 'assets/images/fashion.png'),
    AllCategorysList(
        title: 'Travel', categoriesImage: 'assets/images/travel.png'),
    AllCategorysList(
        title: 'Entertainment',
        categoriesImage: 'assets/images/entertainment.png'),
    AllCategorysList(
        title: 'Beauty', categoriesImage: 'assets/images/beauty.png'),
    AllCategorysList(
        title: 'Electronics', categoriesImage: 'assets/images/electronice.png'),
    AllCategorysList(
        title: 'Pharmacy', categoriesImage: 'assets/images/pharmacy.png'),
    AllCategorysList(
        title: 'Home Decor', categoriesImage: 'assets/images/homedecor.png'),
    AllCategorysList(
        title: 'Watches', categoriesImage: 'assets/images/watches.png'),
  ];
  List<TopTrendingModel> topTrending = [
    TopTrendingModel(
        brandImage: 'assets/images/zomato-group.png',
        brandName: 'Zomato',
        discount: 6.5,
        type: 'Food'),
    TopTrendingModel(
        brandImage: 'assets/images/uber-group.png',
        brandName: 'Uber',
        discount: 8.5,
        type: 'Travel'),
    TopTrendingModel(
        brandImage: 'assets/images/myntra-group.png',
        brandName: 'Myntra',
        discount: 3.5,
        type: 'Fashion'),
    TopTrendingModel(
        brandImage: 'assets/images/bigbasket-group.png',
        brandName: 'Bigbasket',
        discount: 5.5,
        type: 'Grocery'),
  ];
  List<String> discount = [
    "10% off",
    "6.5% off",
    "5% off",
    "2.5% off",
  ];

  List<entertainmentwithhotdeals> entertainmentHotDeals = [
    entertainmentwithhotdeals(
        brandImage: 'assets/images/bookmyshow.png',
        brandName: 'Book My Show',
        discount: 6.5,
        type: 'Entertainment'),
    entertainmentwithhotdeals(
        brandImage: 'assets/images/pvr.png',
        brandName: 'PVR',
        discount: 8.5,
        type: 'Entertainment'),
    entertainmentwithhotdeals(
        brandImage: 'assets/images/shemaroo.png',
        brandName: 'Shemaroo',
        discount: 3.5,
        type: 'Entertainment'),
    entertainmentwithhotdeals(
        brandImage: 'assets/images/hoichoi.png',
        brandName: 'Hoichoi',
        discount: 5.5,
        type: 'Entertainment'),
  ];
  List<GiftingLoveModel> giftLoveList = [
    GiftingLoveModel(
      brandname: 'Hamleys',
      discount: '3.5',
      image: 'assets/images/gift1.png',
    ),
    GiftingLoveModel(
      brandname: 'Hamleys',
      discount: '3.5',
      image: 'assets/images/gift1.png',
    ),
    GiftingLoveModel(
      brandname: 'Hamleys',
      discount: '3.5',
      image: 'assets/images/gift1.png',
    ),
    GiftingLoveModel(
      brandname: 'Hamleys',
      discount: '3.5',
      image: 'assets/images/gift1.png',
    ),
    // GiftingLoveModel(
    //   brandname: '',
    //   discount: '',
    //   image: 'assets/images/viewall-gift.png',
    // ),
  ];

  ////////Cart page work///////

  List<AddMoney> amount = [
    AddMoney(amountName: '200', amount: 250.0, quantity: 0),
    AddMoney(amountName: '500', amount: 500.0, quantity: 0),
    AddMoney(amountName: '1,000', amount: 1000.0, quantity: 0),
    AddMoney(amountName: '2,000', amount: 2000.0, quantity: 0),
    AddMoney(amountName: '5,000', amount: 5000.0, quantity: 0),
    // Add more items as needed
  ];

  void increaseNumber(double, index) {
    amount[index].quantity++;
    notifyListeners();
  }

  void decreaseNumber(double, index) {
    if (amount[index].quantity > 0) {
      amount[index].quantity--;
    }
    notifyListeners();
  }

  double getTotalamount() {
    return amount.fold(0, (total, item) => total + item.amount * item.quantity);
  }

  double getTotalAmountWithDecreaseinPercentage() {
    double totalAmount =
        amount.fold(0, (total, item) => total + item.amount * item.quantity);
    double decreaseAmount = totalAmount * 0.05; // 5% decrease
    return totalAmount - decreaseAmount;
  }

  double _decreaseAmount = 0;

  double getDiscountDecreaseAmount(List<AddMoney> items) {
    double totalAmount =
        items.fold(0, (total, item) => total + item.amount * item.quantity);
    _decreaseAmount = totalAmount * 0.05; // 5% decrease
    return _decreaseAmount;
  }
}
