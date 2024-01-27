class CartDataModel {
  String? userId;
  String? brandcode;
  num? discount;
  List<Vouchers>? vouchers;

  CartDataModel({this.userId, this.brandcode, this.discount, this.vouchers});

  CartDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    brandcode = json['brandcode'];
    discount = json['discount'];
    if (json['vouchers'] != null) {
      vouchers = <Vouchers>[];
      json['vouchers'].forEach((v) {
        vouchers!.add(new Vouchers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['brandcode'] = this.brandcode;
    data['discount'] = this.discount;
    if (this.vouchers != null) {
      data['vouchers'] = this.vouchers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vouchers {
  num? qty;
  num? amount;

  Vouchers({this.qty, this.amount});

  Vouchers.fromJson(Map<String, dynamic> json) {
    qty = json['qty'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qty'] = this.qty;
    data['amount'] = this.amount;
    return data;
  }
}
