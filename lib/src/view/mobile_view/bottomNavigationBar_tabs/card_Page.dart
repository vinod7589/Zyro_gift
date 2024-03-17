import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_page/card_page/credit_card.dart';
import '../home_page/card_page/prepaid_card_page.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  List<String> tabs = [
    'Prepaid',
    'Credit',
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF262329),
                    ),
                    child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            current = index;
                            tabController.animateTo(current);
                          });
                        },
                        child: AnimatedContainer(
                          transformAlignment: Alignment.center,
                          curve: Curves.linearToEaseOut,
                          duration: Duration(milliseconds: 300),
                          alignment: Alignment.center,
                          width: current == index ? 150 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: current == index
                                ? Colors.white
                                : Colors.transparent,
                          ),
                          child: Text(
                            current == index
                                ? '${tabs[index]} ' 'Card'
                                : tabs[index],
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: true,
                            style: TextStyle(
                              color: current == index
                                  ? Colors.black
                                  : Colors.white54,
                              fontSize: current == index ? 15.sp : 15.sp,
                              fontWeight: current == index
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    // First TabBarView
                    PrepaidCardPage(), // Content for Prepaid Tab
                    // Second TabBarView
                    CreditCardPage(), // Content for Credit Tab
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
