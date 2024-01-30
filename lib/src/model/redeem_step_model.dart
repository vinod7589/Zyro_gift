import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RedeemStepEntityModel {
  String title;
  String image;

  RedeemStepEntityModel({
    required this.title,
    required this.image,
  });

  factory RedeemStepEntityModel.fromJson(Map<String, dynamic> json) {
    return RedeemStepEntityModel(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
