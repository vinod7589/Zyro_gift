import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myntra_card_page.dart';

class ApplyCouponPage extends StatelessWidget {
  const ApplyCouponPage({super.key});

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
            'Apply Coupon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 1.11,
              letterSpacing: 0.08,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              height: 53,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFF878787)),
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
                          color: Color(0xFF9D9D9D),
                          height: 18,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          'Type coupon code here',
                          style: TextStyle(
                            color: Color(0xFF9D9D9D),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.29,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Image.asset(
                  //   'assets/images/rightarrow.png',
                  //   height: 18,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BEST OFFERS FOR YOU!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.29,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 23,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyntraCardPAge()));
                },
                child: Image.asset('assets/images/offbanner.png')),
            SizedBox(
              height: 11,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyntraCardPAge()));
                },
                child: Image.asset('assets/images/offbanner2.png')),
            SizedBox(
              height: 11,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyntraCardPAge()));
                },
                child: Image.asset('assets/images/offbanner3.png')),
          ],
        ),
      ),
    );
  }
}
