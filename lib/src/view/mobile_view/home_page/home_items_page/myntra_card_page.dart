import 'package:abc/src/view/mobile_view/home_page/home_items_page/payment_option_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apply_coupon_page.dart';

class MyntraCardPAge extends StatelessWidget {
  const MyntraCardPAge({super.key});

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
          'Myntra Card',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.11,
            letterSpacing: 0.08,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            width: double.infinity,
            height: 174,
            decoration: BoxDecoration(
                color: Colors.deepPurple.shade800.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF494949),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 19, top: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/editpencil.png',
                        height: 16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Image.asset(
                  'assets/images/myntra-m-logo.png',
                  height: 20,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Card worth',
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
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: ' ₹ ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.14,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.46,
                        ),
                      ),
                      TextSpan(
                        text: '2,500',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.14,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.46,
                        ),
                      ),
                    ],
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
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get ',
                style: TextStyle(
                  color: Color(0xFFAC61FF),
                  fontSize: 11.25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.19,
                  letterSpacing: 0.06,
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Text(
                '5% off',
                style: TextStyle(
                  color: Color(0xFFAC61FF),
                  fontSize: 12.38,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.19,
                  letterSpacing: 0.06,
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' ₹ ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.88,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.28,
                ),
              ),
              Text(
                '2500',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.38,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.19,
                  letterSpacing: 0.06,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.46,
                      ),
                    ),
                    TextSpan(
                      text: '2,375.5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.46,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApplyCouponPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    height: 53,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF878787)),
                        borderRadius: BorderRadius.circular(34),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Ticket.png',
                                height: 20,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                'Apply Coupon Code',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 1.29,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/rightarrow.png',
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Color(0xFF2D2D2D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 1),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/Paper.png',
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  'Terms & Conditions',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.06,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.24,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/images/rightarrow.png',
                            height: 18,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Color(0xFF454545),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/chekbox.png',
                            height: 18,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Comes with 6 months validity.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.06,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.24,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/chekbox.png',
                            height: 18,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          SizedBox(
                            width: 289,
                            child: Text(
                              'You can use a maximum 10% of your accrued rewards when generating a voucher for this brand.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.06,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/chekbox.png',
                            height: 18,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          SizedBox(
                            width: 291,
                            child: Text(
                              'Max.    25,000/month can be loaded in Myntra wallet.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.06,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 51,
                          child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFF2C2C2C),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12))),
                                      // Customize the content of your bottom sheet here
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 12),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF444444),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  height: 5,
                                                  width: 100,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/myntra-m-logo.png',
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: 14,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: ' ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.20,
                                                              fontFamily:
                                                                  'Urbanist',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  0.32,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '₹',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.20,
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  0.32,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: ' ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.20,
                                                              fontFamily:
                                                                  'Urbanist',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  0.32,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '2,500',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16.20,
                                                              fontFamily:
                                                                  'Urbanist',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              letterSpacing:
                                                                  0.32,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Brand Card',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.89,
                                                        fontFamily: 'Urbanist',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.38,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: ' ₹ ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 23.14,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.46,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '2,500',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 23.14,
                                                          fontFamily:
                                                              'Urbanist',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 0.46,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Brand Card',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.30,
                                                        ),
                                                      ),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹ ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Urbanist',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    0.32,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '2,500',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Urbanist',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.32,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Discount',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    0.30,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              '(5% off)',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFFAC61FF),
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    0.32,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' -₹',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Urbanist',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    0.32,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '125',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Urbanist',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                letterSpacing:
                                                                    0.32,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Divider(
                                                    color: Color(0xFF363636),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Amount to pay',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.34,
                                                        ),
                                                      ),
                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹ ',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 23.14,
                                                                fontFamily:
                                                                    'Urbanist',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    0.46,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '2,375',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 23.14,
                                                                fontFamily:
                                                                    'Urbanist',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.46,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 20,
                                                        left: 25,
                                                        right: 25),
                                                    height: 51,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                                    Colors
                                                                        .white)),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PaymentOptionPage()));
                                                        },
                                                        child: Text(
                                                          'Pay ₹2350',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2C2C2C),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.11,
                                                            letterSpacing: 0.08,
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Get This Card',
                                style: TextStyle(
                                  color: Color(0xFF2C2C2C),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 1.11,
                                  letterSpacing: 0.08,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
