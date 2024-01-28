class PurchaseGiftVoucherModel {
  PurchaseGiftData? data;
  String? status;
  String? description;

  PurchaseGiftVoucherModel({this.data, this.status, this.description});

  PurchaseGiftVoucherModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new PurchaseGiftData.fromJson(json['data'])
        : null;
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

class PurchaseGiftData {
  int? successcount;
  int? failedcount;
  int? successamount;
  int? failedamount;

  PurchaseGiftData(
      {this.successcount,
      this.failedcount,
      this.successamount,
      this.failedamount});

  PurchaseGiftData.fromJson(Map<String, dynamic> json) {
    successcount = json['successcount'];
    failedcount = json['failedcount'];
    successamount = json['successamount'];
    failedamount = json['failedamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['successcount'] = this.successcount;
    data['failedcount'] = this.failedcount;
    data['successamount'] = this.successamount;
    data['failedamount'] = this.failedamount;
    return data;
  }
}
