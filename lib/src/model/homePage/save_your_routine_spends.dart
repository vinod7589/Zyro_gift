import 'dart:ui';

class ProductBanner {
  String? title;
  String? discount;
  String? companyImages;
  String? productImages;
  Color? color1;
  Color? color2;

  ProductBanner({
    this.title,
    this.discount,
    this.companyImages,
    this.productImages,
    this.color1,
    this.color2,
  });
  ProductBanner.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    discount = json['Discount'];
    companyImages = json['Images1'];
    productImages = json['Images2'];
    color1 = json['color1'];
    color2 = json['color2'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['Discount'] = this.discount;
    data['Images1'] = this.companyImages;
    data['Images2'] = this.productImages;
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    return data;
  }
}
