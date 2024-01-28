import 'dart:convert';

class TransactionsHistory {
  final List<Transaction> data;
  final String? status;
  final String? description;

  TransactionsHistory({
    required this.data,
    required this.status,
    required this.description,
  });

  TransactionsHistory copyWith({
    List<Transaction>? data,
    String? status,
    String? description,
  }) =>
      TransactionsHistory(
        data: data ?? this.data,
        status: status ?? this.status,
        description: description ?? this.description,
      );

  factory TransactionsHistory.fromRawJson(String str) =>
      TransactionsHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransactionsHistory.fromJson(Map<String, dynamic> json) =>
      TransactionsHistory(
        data: json["data"] == null
            ? []
            : List<Transaction>.from(
                json["data"].map((x) => Transaction.fromJson(x))),
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "description": description,
      };
}

class Transaction {
  final num srNo;
  final String customerId;
  final String brandName;
  final String brandCode;
  final num totalTransAmount;
  final String type;
  final String status;
  final String ondate;

  Transaction({
    required this.srNo,
    required this.customerId,
    required this.brandName,
    required this.brandCode,
    required this.totalTransAmount,
    required this.type,
    required this.status,
    required this.ondate,
  });

  Transaction copyWith({
    num? srNo,
    String? customerId,
    String? brandName,
    String? brandCode,
    num? totalTransAmount,
    String? type,
    String? status,
    String? ondate,
  }) =>
      Transaction(
        srNo: srNo ?? this.srNo,
        customerId: customerId ?? this.customerId,
        brandName: brandName ?? this.brandName,
        brandCode: brandCode ?? this.brandCode,
        totalTransAmount: totalTransAmount ?? this.totalTransAmount,
        type: type ?? this.type,
        status: status ?? this.status,
        ondate: ondate ?? this.ondate,
      );

  factory Transaction.fromRawJson(String str) =>
      Transaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        srNo: json["srNo"],
        customerId: json["customerId"],
        brandName: json["brandName"],
        brandCode: json["brandCode"],
        totalTransAmount: json["totalTransAmount"],
        type: json["type"],
        status: json["status"],
        ondate: json["ondate"],
      );

  Map<String, dynamic> toJson() => {
        "srNo": srNo,
        "customerId": customerId,
        "brandName": brandName,
        "brandCode": brandCode,
        "totalTransAmount": totalTransAmount,
        "type": type,
        "status": status,
        "ondate": ondate,
      };
}
