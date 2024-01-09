import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Packages/carousel_slider/carousel_controller.dart';
import '../../../../model/homePage/categories_model.dart';
import '../../../../model/homePage/popular_brands.dart';
import '../../../../model/homePage/save_your_routine_spends.dart';

final HomeGlobalPage =
    ChangeNotifierProvider.autoDispose<homeGlobalPAge>((ref) {
  return homeGlobalPAge(ref.read);
});

class homeGlobalPAge extends ChangeNotifier {
  homeGlobalPAge(this._reader);

  final Reader _reader;
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
        companyImages: 'assets/images/Zomato_logo.jpg',
        productImages: 'assets/images/pizza1.png',
        color1: Color.fromRGBO(167, 0, 0, 0.04),
        color2: Color.fromRGBO(208, 75, 75, 0.29),
        title: 'Zomato'),
    ProductBanner(
        discount: '10.5',
        companyImages: 'assets/images/uber.png',
        productImages: 'assets/images/handmobile1.png',
        color1: Color.fromRGBO(215, 215, 215, 0.04),
        color2: Color.fromRGBO(118, 118, 118, 0.29),
        title: 'Uber'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/amazon.png',
        productImages: 'assets/images/laptop.png',
        color1: Color.fromRGBO(215, 215, 215, 0.04),
        color2: Color.fromRGBO(118, 118, 118, 0.29),
        title: 'Amazon'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/myntra.png',
        productImages: 'assets/images/myntra-girl.png',
        color1: Color.fromRGBO(84, 69, 99, 1),
        color2: Color.fromRGBO(255, 25, 148, 1.0),
        title: 'Zomato'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/bigbasket.png',
        productImages: 'assets/images/vegetable.png',
        color1: Color.fromRGBO(168, 168, 168, 0.04),
        color2: Color.fromRGBO(4, 198, 0, 0.29),
        title: 'Bigbasket'),
    ProductBanner(
        discount: '6.5',
        companyImages: 'assets/images/flipkart.png',
        productImages: 'assets/images/mixer.png',
        color1: Color.fromRGBO(215, 215, 215, 0.04),
        color2: Color.fromRGBO(118, 118, 118, 0.29),
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
  List<String> discount = [
    "10% off",
    "6.5% off",
    "5% off",
    "2.5% off",
  ];

  void increaseNumber() {
    _number++;
    notifyListeners();
  }

  void decreaseNumber() {
    if (_number > 0) {
      _number--;
    }
    notifyListeners();
  }
}
