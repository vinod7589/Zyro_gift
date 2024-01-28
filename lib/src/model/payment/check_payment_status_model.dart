class CheckPaymentStatusModel {
  String? bankReference;
  bool? success;
  String? message;

  CheckPaymentStatusModel({this.bankReference, this.success, this.message});

  CheckPaymentStatusModel.fromJson(Map<String, dynamic> json) {
    bankReference = json['bank_reference'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bank_reference'] = bankReference;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
