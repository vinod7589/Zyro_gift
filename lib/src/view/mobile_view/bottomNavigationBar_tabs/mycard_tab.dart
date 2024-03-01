import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/my_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/base_url.dart';

class MyCardTab extends StatefulWidget {
  const MyCardTab({super.key});

  @override
  State<MyCardTab> createState() => _MyCardTabState();
}

class _MyCardTabState extends State<MyCardTab> {
  DrawerRepoService drawerRepo = DrawerRepoService();

  @override
  void initState() {
    super.initState();
    fetch();
    print('dtatt$fetch');
  }

  List<MyCardList> myCardListItems = [];

  Future<void> fetch() async {
    isLoading = true;
    myCardListItems = await drawerRepo.myCard(
          "",
        ) ??
        [];
    isLoading = false;
    setState(() {});
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
          scrolledUnderElevation: 0,
          titleSpacing: -20,
          leading: Text(''),
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: Colors.white,
          //   ),
          // ),
          backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
          title: Text(
            'My Card',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
            ),
          )),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : (myCardListItems.isEmpty)
              ? Center(
                  child: Text(
                    'No Cards found.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // ),
                    if (index < myCardListItems.length) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        width: double.infinity,
                        height: 200.h,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade800.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF494949),
                            )),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 34,
                            ),
                            Image.network(
                              baseUrl +
                                  myCardListItems[index].brandImage.toString(),
                              height: 40,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/others.png',
                                    height: 40);
                              },
                            ),
                            14.verticalSpace,
                            Text(
                              myCardListItems[index].brandName.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.24,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '₹' +
                                  myCardListItems[index]
                                      .totalVoucherAmount
                                      .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23.14,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.46,
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '. . . .',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          'Zyro Gifts',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.50,
                                            fontFamily: 'Urbanist',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  itemCount: myCardListItems.length + 1,
                ),
    );
  }
}
