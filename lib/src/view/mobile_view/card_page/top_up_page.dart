import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/Packages/page_transition/page_transition.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/mobile_view/card_page/card_wallete_payment_option_page.dart';
import 'package:abc/src/view/widgets/botton_animation_widget.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/height.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  List<int> fixMoney = [1000, 2000, 5000, 10000];
  int selectedIndex = 0;
  TextEditingController _moneyController = TextEditingController();

  @override
  void initState() {
    _moneyController.text = fixMoney[selectedIndex].toString();
    if (kDebugMode) {
      print(fixMoney[selectedIndex]);
    }
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text('Add Money'),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23, vertical: 15),
              decoration: ShapeDecoration(
                color: Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '₹',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.76.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.21,
                              ),
                            ),
                            TextSpan(
                              text: '3,00,000.43',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.76.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.21,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                      6.verticalSpace,
                      Text(
                        'Your Balance',
                        style: TextStyle(
                          color: Color(0xFFDFDFDF),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.13,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/wallet2.png',
                    height: 100,
                  )
                ],
              ),
            ),
            29.verticalSpace,
            Text(
              'Add money to your Prepaid Card',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            12.verticalSpace,
            Container(
              padding:
                  EdgeInsets.only(top: 18, bottom: 36, left: 16, right: 16),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF393939)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  AppTextField(
                    textController: _moneyController,
                    onChanged: (value) {
                      _moneyController.text = value;
                    },
                    keyboardType: TextInputType.number,
                    fillColor: Color(0xFF1E1E1E),
                    borderColor: Color(0xFF2D2D2D),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  47.verticalSpace,
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {});
                              selectedIndex = index;

                              _moneyController.text =
                                  fixMoney[selectedIndex].toString();
                              if (kDebugMode) {
                                print('${fixMoney[selectedIndex]}');
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 65,
                              height: 27,
                              decoration: ShapeDecoration(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: selectedIndex == index
                                          ? Colors.transparent
                                          : Colors.white),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                              child: Text(
                                '₹${fixMoney[index]}',
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? Color(0xFF252525)
                                      : Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.32,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 9,
                            ),
                        itemCount: fixMoney.length),
                  )
                ],
              ),
            ),
            Spacer(),
            AnimationButton(
                onPress: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const CardWalletePaymentOptionPage(),
                          type: PageTransitionType.rightToLeft));
                },
                width: Height.ButtonWidth,
                title: 'Add Money'),
            25.verticalSpace,
          ],
        ),
      ),
    );
  }
}
