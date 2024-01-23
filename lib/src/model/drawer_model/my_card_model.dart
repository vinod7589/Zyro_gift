class MyCardModel {
  List<MyCardList>? data;
  String? status;
  String? description;

  MyCardModel({this.data, this.status, this.description});

  MyCardModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MyCardList>[];
      json['data'].forEach((v) {
        data!.add(new MyCardList.fromJson(v));
      });
    }
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

class MyCardList {
  String? brandCode;
  String? brandName;
  String? brandImage;
  int? voucherQty;
  int? totalVoucherAmount;

  MyCardList(
      {this.brandCode,
      this.brandName,
      this.brandImage,
      this.voucherQty,
      this.totalVoucherAmount});

  MyCardList.fromJson(Map<String, dynamic> json) {
    brandCode = json['brandCode'];
    brandName = json['brandName'];
    brandImage = json['brandImage'];
    voucherQty = json['voucherQty'];
    totalVoucherAmount = json['totalVoucherAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brandCode'] = this.brandCode;
    data['brandName'] = this.brandName;
    data['brandImage'] = this.brandImage;
    data['voucherQty'] = this.voucherQty;
    data['totalVoucherAmount'] = this.totalVoucherAmount;
    return data;
  }
}
