class PrepaidCardDetailsModel {
  String? refNumber;
  String? walletId;

  PrepaidCardDetailsModel({this.refNumber, this.walletId});

  PrepaidCardDetailsModel.fromJson(Map<String, dynamic> json) {
    refNumber = json['refNumber'];
    walletId = json['walletId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refNumber'] = this.refNumber;
    data['walletId'] = this.walletId;
    return data;
  }
}
