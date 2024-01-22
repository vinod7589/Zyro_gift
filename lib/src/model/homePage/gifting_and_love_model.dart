class GiftingLoveModel {
  String? image;
  String? brandname;
  String? discount;

  GiftingLoveModel({
    this.image,
    this.brandname,
    this.discount,
  });

  factory GiftingLoveModel.fromJson(Map<String, dynamic> json) {
    return GiftingLoveModel(
      image: json['image'],
      brandname: json['brandname'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'brandname': brandname,
      'discount': discount,
    };
  }
}
