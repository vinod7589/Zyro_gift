import 'dart:ui';

class CategoriesEntity {
  String? title;
  String? companyImages1;
  String? companyImages2;
  String? productImages;
  Color? color1;

  CategoriesEntity({
    this.title,
    this.companyImages1,
    this.companyImages2,
    this.productImages,
    this.color1,
  });
  CategoriesEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    companyImages1 = json['Images1'];
    companyImages2 = json['companyImages2'];
    productImages = json['Images2'];
    color1 = json['color1'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['Images1'] = this.companyImages1;
    data['companyImages2'] = this.companyImages2;
    data['Images2'] = this.productImages;
    data['color1'] = this.color1;
    return data;
  }
}
