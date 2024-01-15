import 'package:meta/meta.dart';
import 'dart:convert';

class GetAllBrandList {
  final List<AllBrandList> data;
  final String status;
  final String description;

  GetAllBrandList({
    required this.data,
    required this.status,
    required this.description,
  });

  GetAllBrandList copyWith({
    List<AllBrandList>? data,
    String? status,
    String? description,
  }) =>
      GetAllBrandList(
        data: data ?? this.data,
        status: status ?? this.status,
        description: description ?? this.description,
      );

  factory GetAllBrandList.fromRawJson(String str) =>
      GetAllBrandList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllBrandList.fromJson(Map<String, dynamic> json) =>
      GetAllBrandList(
        data: List<AllBrandList>.from(
            json["data"].map((x) => AllBrandList.fromJson(x))),
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "description": description,
      };
}

class AllBrandList {
  final String brandCode;
  final String brandName;
  final String brandtype;
  final String brandImage;
  final String denominationList;
  final int stockAvailable;
  final String category;
  final String descriptions;
  final String redeemSteps;
  final String importantInstruction;
  final String tnc;
  final double discount;

  AllBrandList({
    required this.brandCode,
    required this.brandName,
    required this.brandtype,
    required this.brandImage,
    required this.denominationList,
    required this.stockAvailable,
    required this.category,
    required this.descriptions,
    required this.redeemSteps,
    required this.importantInstruction,
    required this.tnc,
    required this.discount,
  });

  AllBrandList copyWith({
    String? brandCode,
    String? brandName,
    String? brandtype,
    String? brandImage,
    String? denominationList,
    int? stockAvailable,
    String? category,
    String? descriptions,
    String? redeemSteps,
    String? importantInstruction,
    String? tnc,
    double? discount,
  }) =>
      AllBrandList(
        brandCode: brandCode ?? this.brandCode,
        brandName: brandName ?? this.brandName,
        brandtype: brandtype ?? this.brandtype,
        brandImage: brandImage ?? this.brandImage,
        denominationList: denominationList ?? this.denominationList,
        stockAvailable: stockAvailable ?? this.stockAvailable,
        category: category ?? this.category,
        descriptions: descriptions ?? this.descriptions,
        redeemSteps: redeemSteps ?? this.redeemSteps,
        importantInstruction: importantInstruction ?? this.importantInstruction,
        tnc: tnc ?? this.tnc,
        discount: discount ?? this.discount,
      );

  factory AllBrandList.fromRawJson(String str) =>
      AllBrandList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllBrandList.fromJson(Map<String, dynamic> json) => AllBrandList(
        brandCode: json["brandCode"],
        brandName: json["brandName"],
        brandtype: json["brandtype"],
        brandImage: json["brandImage"],
        denominationList: json["denominationList"],
        stockAvailable: json["stockAvailable"],
        category: json["category"],
        descriptions: json["descriptions"],
        redeemSteps: json["redeemSteps"],
        importantInstruction: json["importantInstruction"],
        tnc: json["tnc"],
        discount: json["discount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "brandCode": brandCode,
        "brandName": brandName,
        "brandtype": brandtype,
        "brandImage": brandImage,
        "denominationList": denominationList,
        "stockAvailable": stockAvailable,
        "category": category,
        "descriptions": descriptions,
        "redeemSteps": redeemSteps,
        "importantInstruction": importantInstruction,
        "tnc": tnc,
        "discount": discount,
      };
}
