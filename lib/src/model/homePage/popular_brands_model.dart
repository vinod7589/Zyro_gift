import 'dart:ui';

class PopularBrands {
  String? title;
  String? discount;
  String? companyImages;
  String? code;
  Color? color1;
  Color? color2;

  PopularBrands({
    this.title,
    this.discount,
    this.companyImages,
    this.code,
    this.color1,
    this.color2,
  });
  PopularBrands.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    discount = json['Discount'];
    companyImages = json['Images1'];
    code = json['code'];
    color1 = json['color1'];
    color2 = json['color2'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Title'] = this.title;
    data['Discount'] = this.discount;
    data['Images1'] = this.companyImages;
    data['code'] = this.code;
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    return data;
  }
}
