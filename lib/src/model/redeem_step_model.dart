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

class DateTimeFormatter extends StatelessWidget {
  final DateTime dateTime;

  DateTimeFormatter({
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = formatDate(dateTime);

    return Text(
      formattedDateTime,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.06.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.24,
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    // Format the date as per your requirements
    return DateFormat("d/M/yyyy").format(dateTime);
  }
}
