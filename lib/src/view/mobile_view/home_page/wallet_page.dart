import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Packages/gradient_app_bar/flutter_gradient_app_bar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 20, left: 30, right: 30),
              height: 51,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Top Up',
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
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          elevation: 0,
          brightness: Brightness.dark,
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(35, 35, 35, 1),
            Color.fromRGBO(35, 35, 35, 1),
          ]),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'WalletPage',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.11,
                      letterSpacing: 0.08,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 31,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20, left: 30, right: 30),
                decoration: ShapeDecoration(
                  color: Color(0xFF2D2D2D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '₹100',
                              style: TextStyle(
                                color: Color(0xFFEBEBEB),
                                fontSize: 34,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.68,
                              ),
                            ),
                            Text(
                              'Your Balance',
                              style: TextStyle(
                                color: Color(0xFFEBEBEB),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/images/wallet2.png',
                          height: 112,
                        )
                      ],
                    ),
                    Divider(
                      color: Color(0xFF3B3B3B),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            SvgPicture.asset('assets/images/Discount.svg'),
                            SizedBox(
                              width: 11,
                            ),
                            Text(
                              'Redeem Voucher',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ],
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset(
                            'assets/images/rightarrow.png',
                            height: 18,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Row(
                children: [
                  Text(
                    'Add money to your',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.80,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.44,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 35, left: 15, right: 15),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFF383838)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                        height: 44,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.only(left: 22),
                              filled: true,
                              fillColor: Color(0xFF2D2D2D),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Color(0xFF2D2D2D),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xFF2D2D2D)),
                              ),
                              // prefixIcon: const Padding(
                              //   padding: EdgeInsets.only(top: 14, left: 10),
                              //   child: Text(
                              //     '',
                              //     style: TextStyle(
                              //       color: Color(0xFF676767),
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w500,
                              //       height: 1.29,
                              //     ),
                              //   ),
                              // ),
                              hintStyle: const TextStyle(
                                color: Color(0xFFEBEBEB),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1.29,
                              ),
                              hintText: "₹200",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC7C7C7),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )),
                    SizedBox(
                      height: 47,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 28,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '₹200',
                              style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 28,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '₹500',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 28,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '₹750',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 28,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '₹1000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
