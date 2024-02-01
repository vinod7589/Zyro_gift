import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../controller/home_page_controller.dart';
import '../../../../../../model/homePage/getbrand_details_model.dart';

class AboutThePageToggleWidget extends ConsumerStatefulWidget {
  const AboutThePageToggleWidget({required this.brandData});
  final String brandData;
  @override
  ConsumerState<AboutThePageToggleWidget> createState() =>
      _AboutThePageToggleWidgetState();
}

class _AboutThePageToggleWidgetState
    extends ConsumerState<AboutThePageToggleWidget> {
  bool isExpended = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          isExpended = !isExpended;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          // height: isExpended ? 300 : 55,
          padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 6),
          // height: 160,
          decoration: ShapeDecoration(
            color: Color(0xFF2D2D2D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          // color: Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About the Brand',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      isExpended ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              if (isExpended) ...{
                const Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Divider(
                    color: Color(0xFF454545),
                  ),
                ),
                10.verticalSpace,
                Text(
                  "${widget.brandData != "" ? widget.brandData.replaceAll('"', '') : "Dummy is a one stop shop for all your fashion and lifestyle needs. Being India's largest e-commerce store for fashion and lifestyle products, Dummy aims at providing a hassle free and enjoyable shopping experience to shoppers across the country with the widest range of brands and products on its portal"}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.06,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.24,
                  ),
                ),
                20.verticalSpace
              }
            ],
          ),
        ));
  }
}
