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
  String? orderId;
  String? brandCode;
  String? brandName;
  String? brandImage;
  String? purchaseOn;
  String? expiryOn;
  int? voucherQty;
  int? totalVoucherAmount;

  MyCardList(
      {this.orderId,
      this.brandCode,
      this.brandName,
      this.brandImage,
      this.purchaseOn,
      this.expiryOn,
      this.voucherQty,
      this.totalVoucherAmount});

  MyCardList.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    brandCode = json['brandCode'];
    brandName = json['brandName'];
    brandImage = json['brandImage'];
    purchaseOn = json['purchaseOn'];
    expiryOn = json['expiryOn'];
    voucherQty = json['voucherQty'];
    totalVoucherAmount = json['totalVoucherAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['brandCode'] = this.brandCode;
    data['brandName'] = this.brandName;
    data['brandImage'] = this.brandImage;
    data['purchaseOn'] = this.purchaseOn;
    data['expiryOn'] = this.expiryOn;
    data['voucherQty'] = this.voucherQty;
    data['totalVoucherAmount'] = this.totalVoucherAmount;
    return data;
  }
}
