import 'package:meta/meta.dart';
import 'dart:convert';

class GetAllPopularBrandListsModel {
  final List<GetAllPopularBrandList> data;
  final String status;
  final String description;

  GetAllPopularBrandListsModel({
    required this.data,
    required this.status,
    required this.description,
  });

  GetAllPopularBrandListsModel copyWith({
    List<GetAllPopularBrandList>? data,
    String? status,
    String? description,
  }) =>
      GetAllPopularBrandListsModel(
        data: data ?? this.data,
        status: status ?? this.status,
        description: description ?? this.description,
      );

  factory GetAllPopularBrandListsModel.fromRawJson(String str) =>
      GetAllPopularBrandListsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllPopularBrandListsModel.fromJson(Map<String, dynamic> json) =>
      GetAllPopularBrandListsModel(
        data: List<GetAllPopularBrandList>.from(
            json["data"].map((x) => GetAllPopularBrandList.fromJson(x))),
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "description": description,
      };
}

class GetAllPopularBrandList {
  final int id;
  final String brandName;
  final String brandCode;
  final String image;
  final String additionalImage;
  final num discount;

  GetAllPopularBrandList({
    required this.id,
    required this.brandName,
    required this.brandCode,
    required this.image,
    required this.additionalImage,
    required this.discount,
  });

  GetAllPopularBrandList copyWith({
    int? id,
    String? brandName,
    String? brandCode,
    String? image,
    String? additionalImage,
    num? discount,
  }) =>
      GetAllPopularBrandList(
        id: id ?? this.id,
        brandName: brandName ?? this.brandName,
        brandCode: brandCode ?? this.brandCode,
        image: image ?? this.image,
        additionalImage: additionalImage ?? this.additionalImage,
        discount: discount ?? this.discount,
      );

  factory GetAllPopularBrandList.fromRawJson(String str) =>
      GetAllPopularBrandList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllPopularBrandList.fromJson(Map<String, dynamic> json) =>
      GetAllPopularBrandList(
        id: json["id"],
        brandName: json["brandName"],
        brandCode: json["brandCode"],
        image: json["image"],
        additionalImage: json["additionalImage"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brandName": brandName,
        "brandCode": brandCode,
        "image": image,
        "additionalImage": additionalImage,
        "discount": discount,
      };
}
