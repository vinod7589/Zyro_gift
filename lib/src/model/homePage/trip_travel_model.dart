class TripTravelModel {
  String? brandImage;
  String? brandName;
  double? discount;

  TripTravelModel({
    this.brandImage,
    this.brandName,
    this.discount,
  });

  factory TripTravelModel.fromJson(Map<String, dynamic> json) {
    return TripTravelModel(
      brandImage: json['brandImage'],
      brandName: json['brandName'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandImage': brandImage,
      'brandName': brandName,
      'discount': discount,
    };
  }
}
