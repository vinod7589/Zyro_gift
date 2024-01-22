import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesListView extends StatelessWidget {
  final ScrollController scrollController;
  final List images;

  const MoviesListView({required this.scrollController, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      color: Color(0xFFF8F8F8),
      child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  '${images[index]}',
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
