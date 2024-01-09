import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
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
          title: const Text(
            'TransactionsPage',
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
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Center(
                                child: Image.asset(
                                  'assets/images/card2.png',
                                  height: 36,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Myntra Card',
                                  style: TextStyle(
                                    color: Color(0xFFF0F0F0),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.29,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '11 Jul, 10:09 AM',
                                  style: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1.29,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '-₹',
                              style: TextStyle(
                                color: Color(0xFFF0F0F0),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            ),
                            TextSpan(
                              text: '2500',
                              style: TextStyle(
                                color: Color(0xFFF0F0F0),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFF303030),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Center(
                                child: Image.asset(
                                  'assets/images/card2.png',
                                  height: 36,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amazon Card',
                                  style: TextStyle(
                                    color: Color(0xFFF0F0F0),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.29,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '11 Jul, 10:09 AM',
                                  style: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1.29,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '-₹',
                              style: TextStyle(
                                color: Color(0xFFF0F0F0),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            ),
                            TextSpan(
                              text: '2500',
                              style: TextStyle(
                                color: Color(0xFFF0F0F0),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFF303030),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Center(
                                child: Image.asset(
                                  'assets/images/card2.png',
                                  height: 36,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Uber Card',
                                  style: TextStyle(
                                    color: Color(0xFFF0F0F0),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.29,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '11 Jul, 10:09 AM',
                                  style: TextStyle(
                                    color: Color(0xFFA2A2A2),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1.29,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '-₹',
                              style: TextStyle(
                                color: Color(0xFFF0F0F0),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.32,
                              ),
                            ),
                            TextSpan(
                              text: '2500',
                              style: TextStyle(
                                color: Color(0xFFF0F0F0),
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.32,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xFF303030),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
