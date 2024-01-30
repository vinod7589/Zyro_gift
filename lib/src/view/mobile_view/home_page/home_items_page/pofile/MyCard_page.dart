import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/my_card_model.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/mobile_view/home_page/home_items_page/pofile/My_cardDetails_page.dart';
import 'package:abc/src/view/widgets/dialogs/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../infrastructure/repository/homePage_repo/home_page_repo.dart';
import '../../../../../model/drawer_model/My_carddetails_model.dart';
import '../../../../../model/homePage/getbrand_details_model.dart';

class MyCardPage extends StatefulWidget {
  const MyCardPage({super.key});

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  HomePageService homeRepo = HomePageService();
  DrawerRepoService drawerRepo = DrawerRepoService();

  // late GetBrandDetailsList? brandData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetch();
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
  // getBrand() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var res = await homeRepo.getBrandDetailsService('');
  //   setState(() {
  //     brandData = res;
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
          scrolledUnderElevation: 0,
          titleSpacing: 5,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
          title: Text(
            'My Cards',
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
                    if (index < myCardListItems.length) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyCardDetailsPage(
                                        orderId: myCardListItems[index]
                                            .orderId
                                            .toString(),
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          width: double.infinity,
                          height: 200.h,
                          decoration: BoxDecoration(
                              color:
                                  Colors.deepPurple.shade800.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFF494949),
                              )),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 34,
                              ),
                              // Image.network(
                              //   baseUrl +
                              //       myCardListItems[index].brandImage.toString(),
                              //   height: 40,
                              // ),
                              Image.network(
                                baseUrl +
                                    myCardListItems[index]
                                        .brandImage
                                        .toString(),
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
                              Expanded(
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
                                            'Valid Till : ${myCardListItems[index].expiryOn.toString()}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
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
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  itemCount: myCardListItems.length + 1,
                ),
    );
  }
}
