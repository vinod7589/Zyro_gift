class PrepaidCardTransactionHistoryModel {
  bool? success;
  Data? data;
  String? message;
  Null? errors;
  Null? exception;

  PrepaidCardTransactionHistoryModel(
      {this.success, this.data, this.message, this.errors, this.exception});

  PrepaidCardTransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    errors = json['errors'];
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['exception'] = this.exception;
    return data;
  }
}

class Data {
  String? referenceNumber;
  List<TransactionDetailList>? transactionDetailList;

  Data({this.referenceNumber, this.transactionDetailList});

  Data.fromJson(Map<String, dynamic> json) {
    referenceNumber = json['referenceNumber'];
    if (json['transactionDetailList'] != null) {
      transactionDetailList = <TransactionDetailList>[];
      json['transactionDetailList'].forEach((v) {
        transactionDetailList!.add(new TransactionDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referenceNumber'] = this.referenceNumber;
    if (this.transactionDetailList != null) {
      data['transactionDetailList'] =
          this.transactionDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionDetailList {
  int? transactionAmount;
  int? transactionType;
  String? invoiceNumber;
  String? transactionDate;

  TransactionDetailList(
      {this.transactionAmount,
      this.transactionType,
      this.invoiceNumber,
      this.transactionDate});

  TransactionDetailList.fromJson(Map<String, dynamic> json) {
    transactionAmount = json['transactionAmount'];
    transactionType = json['transactionType'];
    invoiceNumber = json['invoiceNumber'];
    transactionDate = json['transactionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionAmount'] = this.transactionAmount;
    data['transactionType'] = this.transactionType;
    data['invoiceNumber'] = this.invoiceNumber;
    data['transactionDate'] = this.transactionDate;
    return data;
  }
}
