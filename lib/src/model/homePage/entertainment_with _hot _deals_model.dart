class entertainmentwithhotdeals {
  String? brandImage;
  String? brandName;
  String? type;
  double? discount;

  entertainmentwithhotdeals({
    this.brandImage,
    this.brandName,
    this.type,
    this.discount,
  });

  factory entertainmentwithhotdeals.fromJson(Map<String, dynamic> json) {
    return entertainmentwithhotdeals(
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
