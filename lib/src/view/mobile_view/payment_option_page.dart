import 'package:abc/src/constants/color.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/fixed_card_controller.dart';
import '../../model/CartDataModel.dart';
import 'home_page/widget/Home_globalPage.dart';

class PaymentOptionPage extends ConsumerStatefulWidget {
  final CartDataModel cartDataDetails;
  final String brandCode;
  PaymentOptionPage(
      {super.key, required this.cartDataDetails, required this.brandCode});

  @override
  ConsumerState<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends ConsumerState<PaymentOptionPage> {
  void openPaymentIntent(String psp) async {
    String paymentUrl =
        "upi://pay?pa=cfkgcinfotechp@yesbank&pn=KGC%20INFOTECH%20PVT%20LTD&tr=2422099952&am=1.00&cu=INR&mode=00&purpose=00&mc=6012&tn=Payment"; // Replace with your payment URL or deep link
    if (psp == 'phonepe') {
      paymentUrl = paymentUrl.replaceAll('upi://', 'phonepe://');
    } else if (psp == 'googlepay') {
      paymentUrl = paymentUrl.replaceAll('upi://', 'tez://upi/');
    } else if (psp == 'paytm') {
      paymentUrl = paymentUrl.replaceAll('upi://', 'paytmmp://');
    }
    await launchUrl(Uri.parse(paymentUrl));
    // if (await canLaunchUrl(Uri.parse(paymentUrl))) {
    //
    // } else {
    //   throw 'Could not launch $paymentUrl';
    // }
  }

  RegExp upiPattern =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  bool isUpiValid = true;
  TextEditingController _UpiTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var paymentOption = ref.watch(fixedCardController(widget.brandCode));

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
          title: const Text(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF410074).withOpacity(0.2),
                      Colors.deepPurple.withOpacity(0.1)
                    ], // Replace color[grey] with your list of colors
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(17)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total :  ',
                          style: TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        ),
                        Text(
                          '₹ ${(paymentOption.totalCardWorth)}',
                          style: TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount : ',
                          style: TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        ),
                        Text(
                          '₹ ${(paymentOption.totalCardWorth! * widget.cartDataDetails.discount! / 100)}',
                          style: TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        )
                      ],
                    ),
                    15.verticalSpace,
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payable :  ',
                          style: TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.07,
                          ),
                        ),
                        Text(
                          '₹ ${paymentOption.totalCardWorth.toInt() - (paymentOption.totalCardWorth! * widget.cartDataDetails.discount! / 100)}',
                          style: TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.07,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
                        10.horizontalSpace,
                        Text(
                          '( ${widget.cartDataDetails.discount}% OFF)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.05,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF2D2D2D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            openPaymentIntent('googlepay');
                          },
                          child: Row(
                            children: [
                              12.horizontalSpace,
                              Image.asset(
                                'assets/images/gpay.png',
                                height: 47,
                              ),
                              15.horizontalSpace,
                              const Text(
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
                        ),
                        18.verticalSpace,
                        InkWell(
                          onTap: () {
                            openPaymentIntent('phonepe');
                          },
                          child: Row(
                            children: [
                              12.horizontalSpace,
                              Image.asset(
                                'assets/images/phonepay.png',
                                height: 47,
                              ),
                              15.horizontalSpace,
                              const Text(
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
                        ),
                        18.verticalSpace,
                        InkWell(
                          onTap: () {
                            openPaymentIntent('paytm');
                          },
                          child: Row(
                            children: [
                              12.horizontalSpace,
                              Image.asset(
                                'assets/images/paytm.png',
                                height: 47,
                              ),
                              15.horizontalSpace,
                              const Text(
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
                          ),
                        ),
                        18.verticalSpace,
                        InkWell(
                          onTap: () {
                            openPaymentIntent('upi');
                          },
                          child: Row(
                            children: [
                              12.horizontalSpace,
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 5),
                                margin: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    color: Color(0xFF3A3A3A),
                                    borderRadius: BorderRadius.circular(7)),
                                width: 46,
                                height: 46,
                                child: Image.asset(
                                  'assets/images/other.png',
                                  height: 20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              18.horizontalSpace,
                              const Text(
                                'Other',
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
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    'Enter your UPI ID',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                    ),
                  ),
                  10.verticalSpace,
                  TextFormField(
                    controller: _UpiTextEditingController,
                    style: TextStyle(color: Colors.white),
                    onTapOutside: (e) => FocusScope.of(context).unfocus(),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15),
                      // filled: true,
                      focusColor: Colors.deepPurple,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          )),
                      labelText: 'Enter your upi',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isUpiValid = upiPattern.hasMatch(text);
                      });
                    },
                  ),

                  18.verticalSpace,
                  // const Row(
                  //   children: [
                  //     Text(
                  //       'Credit & Debit cards',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 16,
                  //         fontFamily: 'Poppins',
                  //         fontWeight: FontWeight.w500,
                  //         height: 1.11,
                  //         letterSpacing: 0.08,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 20, right: 28),
                  //   height: 65,
                  //   decoration: ShapeDecoration(
                  //     color: const Color(0xFF2D2D2D),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(19),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         child: Row(
                  //           children: [
                  //             Image.asset(
                  //               'assets/images/card.png',
                  //               height: 25,
                  //             ),
                  //             const SizedBox(
                  //               width: 25,
                  //             ),
                  //             const Text(
                  //               'Add New Card',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 15.80,
                  //                 fontFamily: 'Poppins',
                  //                 fontWeight: FontWeight.w500,
                  //                 letterSpacing: 0.44,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Image.asset(
                  //         'assets/images/rightarrow.png',
                  //         height: 16,
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
