import 'dart:convert';


class GetFilteredBrandModel {
  final List<FilteredBrandModel> data;
  final String status;
  final String description;

  GetFilteredBrandModel({
    required this.data,
    required this.status,
    required this.description,
  });

  GetFilteredBrandModel copyWith({
    List<FilteredBrandModel>? data,
    String? status,
    String? description,
  }) =>
      GetFilteredBrandModel(
        data: data ?? this.data,
        status: status ?? this.status,
        description: description ?? this.description,
      );

  factory GetFilteredBrandModel.fromRawJson(String str) =>
      GetFilteredBrandModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetFilteredBrandModel.fromJson(Map<String, dynamic> json) =>
      GetFilteredBrandModel(
        data: List<FilteredBrandModel>.from(
            json["data"].map((x) => FilteredBrandModel.fromJson(x))),
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
    "description": description,
  };
}



FilteredBrandModel filteredBrandModelFromJson(String str) => FilteredBrandModel.fromJson(json.decode(str));

String filteredBrandModelToJson(FilteredBrandModel data) => json.encode(data.toJson());

class FilteredBrandModel {
  final int id;
  final String brandName;
  final String brandCode;
  final String image;
  final String defaultImage;
  final String additionalImage;
  final num discount;
  final String redemptionProcess;

  FilteredBrandModel({
    required this.id,
    required this.brandName,
    required this.brandCode,
    required this.image,
    required this.defaultImage,
    required this.additionalImage,
    required this.discount,
    required this.redemptionProcess,
  });

  factory FilteredBrandModel.fromJson(Map<String, dynamic> json) => FilteredBrandModel(
    id: json["id"],
    brandName: json["brandName"],
    brandCode: json["brandCode"],
    image: json["image"],
    defaultImage: json["defaultImage"],
    additionalImage: json["additionalImage"],
    discount: json["discount"],
    redemptionProcess: json["redemption_Process"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brandName": brandName,
    "brandCode": brandCode,
    "image": image,
    "defaultImage": defaultImage,
    "additionalImage": additionalImage,
    "discount": discount,
    "redemption_Process": redemptionProcess,
  };
}




