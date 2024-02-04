import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class constants {
  static Color success_notification_color_code = Colors.green.shade800;
  static Color failed_notification_color_code = Colors.red.shade800;
  static double dropdownHeight = 56; // HEIGHT OF ALL DROPDOWN
  static double searchBarHeight = 47.h; // HEIGHT OF ALL SEARCH BAR
  static double percentagetext = 30; // HEIGHT OF ALL percentage text
  static double offpercentagetext = 18; // HEIGHT OF ALL percentage text
  static double containertext = 16; // HEIGHT OF ALL container text
  static int commonCount = 20; // NUMBER OF ITEM ON EACH PAGE
  static int CommonRowCountFromAPI =
      60; //FILTER NUMBER ITEMS PER API CALL IN PAGEINATION FOR PAGESIZE
  static int ItemCountDays = 7; //FILTER NUMBER OF DAYS TO SHOW THE RECORDS
  static String paymentLinkUrl = 'https://secure.myzyro.com/PaymentLink/';
}

const String baseUrl = "https://test-zyrogift.xoomsales.com";
