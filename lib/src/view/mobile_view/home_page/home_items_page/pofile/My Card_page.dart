import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/my_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardPage extends StatefulWidget {
  const MyCardPage({super.key});

  @override
  State<MyCardPage> createState() => _MyCardPageState();
}

class _MyCardPageState extends State<MyCardPage> {
  @override
  void initState() {
    super.initState();
    fetch();
  }

  List<MyCardList> myCardListItems = [];
  Future<void> fetch() async {
    myCardListItems = await DrawerRepoService.myCard("", context) ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
          titleSpacing: 5,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromRGBO(35, 35, 35, 1),
          title: Text(
            'Account Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.08,
            ),
          )),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index < myCardListItems.length)
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade800.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFF494949),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 34,
                  ),
                  Image.asset(
                    'assets/images/myntra-m-logo.png',
                    height: 20,
                  ),
                  14.verticalSpace,
                  Text(
                    myCardListItems[index].brandName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.06,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.24,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '₹' + myCardListItems[index].totalVoucherAmount.toString(),
                    style: TextStyle(
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
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  )
                ],
              ),
            );
        },
        itemCount: myCardListItems.length + 1,
      ),
    );
  }
}
