import 'package:meta/meta.dart';
import 'dart:convert';

class TripTravelModel {
  final List<TravelTrip> data;
  final String status;
  final String description;

  TripTravelModel({
    required this.data,
    required this.status,
    required this.description,
  });

  TripTravelModel copyWith({
    List<TravelTrip>? data,
    String? status,
    String? description,
  }) =>
      TripTravelModel(
        data: data ?? this.data,
        status: status ?? this.status,
        description: description ?? this.description,
      );

  factory TripTravelModel.fromRawJson(String str) =>
      TripTravelModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TripTravelModel.fromJson(Map<String, dynamic> json) =>
      TripTravelModel(
        data: json["data"] == null
            ? []
            : List<TravelTrip>.from(
                json["data"].map((x) => TravelTrip.fromJson(x))),
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "description": description,
      };
}

class TravelTrip {
  final int id;
  final String brandName;
  final String brandCode;
  final String image;
  final String additionalImage;
  final double discount;
  final String redemptionProcess;

  TravelTrip({
    required this.id,
    required this.brandName,
    required this.brandCode,
    required this.image,
    required this.additionalImage,
    required this.discount,
    required this.redemptionProcess,
  });

  TravelTrip copyWith({
    int? id,
    String? brandName,
    String? brandCode,
    String? image,
    String? additionalImage,
    double? discount,
    String? redemptionProcess,
  }) =>
      TravelTrip(
        id: id ?? this.id,
        brandName: brandName ?? this.brandName,
        brandCode: brandCode ?? this.brandCode,
        image: image ?? this.image,
        additionalImage: additionalImage ?? this.additionalImage,
        discount: discount ?? this.discount,
        redemptionProcess: redemptionProcess ?? this.redemptionProcess,
      );

  factory TravelTrip.fromRawJson(String str) =>
      TravelTrip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TravelTrip.fromJson(Map<String, dynamic> json) => TravelTrip(
        id: json["id"],
        brandName: json["brandName"],
        brandCode: json["brandCode"],
        image: json["image"],
        additionalImage: json["additionalImage"],
        discount: json["discount"]?.toDouble(),
        redemptionProcess: json["redemption_Process"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brandName": brandName,
        "brandCode": brandCode,
        "image": image,
        "additionalImage": additionalImage,
        "discount": discount,
        "redemption_Process": redemptionProcess,
      };
}
