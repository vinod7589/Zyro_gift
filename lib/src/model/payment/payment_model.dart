class PaymentModel {
  bool? success;
  String? message;
  PaymentData? data;

  PaymentModel({this.success, this.message, this.data});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new PaymentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PaymentData {
  String? paymentMethod;
  String? merchantId;
  Null? orderId;
  String? merchantTransactionId;
  String? transactionId;
  String? intentUrl;

  PaymentData(
      {this.paymentMethod,
      this.merchantId,
      this.orderId,
      this.merchantTransactionId,
      this.transactionId,
      this.intentUrl});

  PaymentData.fromJson(Map<String, dynamic> json) {
    paymentMethod = json['payment_method'];
    merchantId = json['merchantId'];
    orderId = json['order_id'];
    merchantTransactionId = json['merchantTransactionId'];
    transactionId = json['transactionId'];
    intentUrl = json['intent_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method'] = this.paymentMethod;
    data['merchantId'] = this.merchantId;
    data['order_id'] = this.orderId;
    data['merchantTransactionId'] = this.merchantTransactionId;
    data['transactionId'] = this.transactionId;
    data['intent_url'] = this.intentUrl;
    return data;
  }
}
