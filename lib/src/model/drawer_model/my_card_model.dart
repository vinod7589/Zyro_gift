import 'dart:convert';

class MyCardModel {
  final List<MyCardList> data;
  final String status;
  final String description;

  MyCardModel({
    required this.data,
    required this.status,
    required this.description,
  });

  MyCardModel copyWith({
    List<MyCardList>? data,
    String? status,
    String? description,
  }) =>
      MyCardModel(
        data: data ?? this.data,
        status: status ?? this.status,
        description: description ?? this.description,
      );

  factory MyCardModel.fromRawJson(String str) =>
      MyCardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyCardModel.fromJson(Map<String, dynamic> json) => MyCardModel(
        data: List<MyCardList>.from(
            json["data"].map((x) => MyCardList.fromJson(x))),
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "description": description,
      };
}

class MyCardList {
  final String brandCode;
  final String brandName;
  final int voucherQty;
  final int totalVoucherAmount;

  MyCardList({
    required this.brandCode,
    required this.brandName,
    required this.voucherQty,
    required this.totalVoucherAmount,
  });

  MyCardList copyWith({
    String? brandCode,
    String? brandName,
    int? voucherQty,
    int? totalVoucherAmount,
  }) =>
      MyCardList(
        brandCode: brandCode ?? this.brandCode,
        brandName: brandName ?? this.brandName,
        voucherQty: voucherQty ?? this.voucherQty,
        totalVoucherAmount: totalVoucherAmount ?? this.totalVoucherAmount,
      );

  factory MyCardList.fromRawJson(String str) =>
      MyCardList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyCardList.fromJson(Map<String, dynamic> json) => MyCardList(
        brandCode: json["brandCode"],
        brandName: json["brandName"],
        voucherQty: json["voucherQty"],
        totalVoucherAmount: json["totalVoucherAmount"],
      );

  Map<String, dynamic> toJson() => {
        "brandCode": brandCode,
        "brandName": brandName,
        "voucherQty": voucherQty,
        "totalVoucherAmount": totalVoucherAmount,
      };
}
