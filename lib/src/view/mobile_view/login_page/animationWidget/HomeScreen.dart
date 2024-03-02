import 'package:flutter/material.dart';

import 'MoviesListView.dart';
import 'data2.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  ScrollController _scrollController3 = ScrollController();

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   double minScrollExtent1 = _scrollController1.position.minScrollExtent;
    //   double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
    //   double minScrollExtent2 = _scrollController2.position.minScrollExtent;
    //   double maxScrollExtent2 = _scrollController2.position.maxScrollExtent;
    //   double minScrollExtent3 = _scrollController3.position.minScrollExtent;
    //   double maxScrollExtent3 = _scrollController3.position.maxScrollExtent;
    //   //
    //   animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 8,
    //       _scrollController1);
    //   animateToMaxMin(maxScrollExtent2, minScrollExtent2, maxScrollExtent2, 3,
    //       _scrollController2);
    //   animateToMaxMin(maxScrollExtent3, minScrollExtent3, maxScrollExtent3, 6,
    //       _scrollController3);
    // });
  }

  // animateToMaxMin(double max, double min, double direction, int seconds,
  //     ScrollController scrollController) {
  //   scrollController
  //       .animateTo(
  //     direction,
  //     duration: Duration(seconds: seconds),
  //     curve: Curves.linear,
  //   )
  //       .then((value) {
  //     direction = direction == max ? min : max;
  //     animateToMaxMin(max, min, direction, seconds, scrollController);
  //   });
  // }

  // @override
  // void dispose() {
  //   setState(() {
  //     _scrollController1.dispose();
  //     _scrollController2.dispose();
  //     _scrollController3.dispose();
  //   });
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MoviesListView(
                  scrollController: _scrollController1,
                  images: Image1,
                ),
                MoviesListView(
                  scrollController: _scrollController2,
                  images: Image2,
                ),
                MoviesListView(
                  scrollController: _scrollController3,
                  images: Image3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
