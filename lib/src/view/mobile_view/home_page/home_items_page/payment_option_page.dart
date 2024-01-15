import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/Home_globalPage.dart';

class PaymentOptionPage extends ConsumerWidget {
  const PaymentOptionPage();

  @override
  Widget build(BuildContext context, ref) {
    var paymentOption = ref.watch(HomeGlobalPage);
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
            'Payment Option',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1.11,
              letterSpacing: 0.08,
            ),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Text(
                  'Total : ${paymentOption.getTotalAmountWithDecreaseinPercentage()}',
                  style: TextStyle(
                    color: Color(0xFFE0E0E0),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.11,
                    letterSpacing: 0.07,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 31,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        'UPI',
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
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                  decoration: ShapeDecoration(
                    color: Color(0xFF2D2D2D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/radiobutton.png',
                            height: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Image.asset(
                            'assets/images/gpay.png',
                            height: 47,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Google Pay',
                            textAlign: TextAlign.center,
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
                        height: 18,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/radiobutton.png',
                            height: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Image.asset(
                            'assets/images/phonepay.png',
                            height: 47,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'PhonePe UPI',
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
                        height: 18,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/radiobutton.png',
                            height: 16,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Image.asset(
                            'assets/images/paytm.png',
                            height: 47,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'PayTm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.80,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.44,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      'Credit & Debit cards',
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
                  height: 18,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 28),
                  height: 65,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2D2D2D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/card.png',
                              height: 25,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              'Add New Card',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.80,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.44,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/rightarrow.png',
                        height: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
