class TopTrendingModel {
  String? brandImage;
  String? brandName;
  String? type;
  double? discount;

  TopTrendingModel({
    this.brandImage,
    this.brandName,
    this.type,
    this.discount,
  });

  factory TopTrendingModel.fromJson(Map<String, dynamic> json) {
    return TopTrendingModel(
      brandImage: json['brandImage'],
      brandName: json['brandName'],
      type: json['type'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandImage': brandImage,
      'brandName': brandName,
      'type': type,
      'discount': discount,
    };
  }
}
