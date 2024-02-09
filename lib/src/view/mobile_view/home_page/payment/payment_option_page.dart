// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:abc/src/Packages/page_transition/enum.dart';
import 'package:abc/src/infrastructure/repository/payment_repo.dart';
import 'package:abc/src/model/payment/check_payment_status_model.dart';
import 'package:abc/src/model/payment/payment_model.dart';
import 'package:abc/src/model/payment/purchasegift_voucher_model.dart';
import 'package:abc/src/view/mobile_view/home_page/payment/payment_timer_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../../Packages/page_transition/page_transition.dart';
import '../../../../controller/fixed_card_controller.dart';
import '../../../../model/CartDataModel.dart';

class PaymentOptionPage extends ConsumerStatefulWidget {
  final CartDataModel cartDataDetails;
  final String brandCode;
  const PaymentOptionPage(
      {super.key, required this.cartDataDetails, required this.brandCode});

  @override
  ConsumerState<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends ConsumerState<PaymentOptionPage> {
  PaymentRepo paymentservice = PaymentRepo();
  bool isLoading = false;
  num amount = 0;
  num discount = 0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      amount = widget.cartDataDetails.vouchers!.fold(
          0,
          (previousValue, element) =>
              previousValue + (element.qty! * element.amount!));
    });
  }

  void openPaymentIntent(String psp) async {
    String paymentUrl = '';
    String merchantTransactionId = '';
    //var paymentOption = ref.watch(fixedCardController(widget.brandCode));
    setState(() {
      isLoading = true;
    });
    num payableAmount =
        amount - (amount * widget.cartDataDetails.discount! / 100);
    PaymentModel res = await paymentservice.paymentService(
        payableAmount, widget.cartDataDetails);
    if (res.success == true) {
      paymentUrl = res.data!.intentUrl!;
      merchantTransactionId = res.data!.orderId!;
      if (paymentUrl != '') {
        if (psp == 'phonepe') {
          paymentUrl = paymentUrl.replaceAll('upi://', 'phonepe://');
        } else if (psp == 'googlepay') {
          paymentUrl = paymentUrl.replaceAll('upi://', 'tez://upi/');
        } else if (psp == 'paytm') {
          paymentUrl = paymentUrl.replaceAll('upi://', 'paytmmp://');
        }
        await launchUrl(Uri.parse(paymentUrl));
        setState(() {
          isLoading = false;
        });

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TimerCountPage(
                    cartDataDetails: widget.cartDataDetails,
                    brandCode: widget.brandCode,
                    merchantTransactionId: merchantTransactionId)));
      } else {}
    }
  }

  RegExp upiPattern =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  bool isUpiValid = true;
  final TextEditingController _upiTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    //var paymentOption = ref.watch(fixedCardController(widget.brandCode));

    return isLoading == true
        ? Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: 50,
            ),
          )
        : Scaffold(
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
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF410074).withOpacity(0.2),
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
                                  color: const Color(0xFFE0E0E0),
                                  fontSize: 16.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.07,
                                ),
                              ),
                              Text(
                                '₹ $amount',
                                style: TextStyle(
                                  color: const Color(0xFFE0E0E0),
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
                                  color: const Color(0xFFE0E0E0),
                                  fontSize: 16.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.07,
                                ),
                              ),
                              Text(
                                '₹ ${(amount * widget.cartDataDetails.discount! / 100)}',
                                style: TextStyle(
                                  color: const Color(0xFFE0E0E0),
                                  fontSize: 16.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.07,
                                ),
                              )
                            ],
                          ),
                          15.verticalSpace,
                          const Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payable :  ',
                                style: TextStyle(
                                  color: const Color(0xFFE0E0E0),
                                  fontSize: 16.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.07,
                                ),
                              ),
                              Text(
                                '₹ ${amount - (amount * widget.cartDataDetails.discount! / 100)}',
                                style: TextStyle(
                                  color: const Color(0xFFE0E0E0),
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
                              const Text(
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
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, bottom: 15),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 5),
                                      margin: const EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF3A3A3A),
                                          borderRadius:
                                              BorderRadius.circular(7)),
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
                        // 20.verticalSpace,
                        // const Text(
                        //   'Enter your UPI ID',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 16,
                        //     fontFamily: 'Poppins',
                        //     fontWeight: FontWeight.w500,
                        //     letterSpacing: 0.08,
                        //   ),
                        // ),
                        // 10.verticalSpace,
                        // TextFormField(
                        //   controller: _upiTextEditingController,
                        //   style: const TextStyle(color: Colors.white),
                        //   onTapOutside: (e) => FocusScope.of(context).unfocus(),
                        //   keyboardType: TextInputType.emailAddress,
                        //   cursorColor: Colors.deepPurple,
                        //   decoration: InputDecoration(
                        //     contentPadding: const EdgeInsets.only(left: 15),
                        //     // filled: true,
                        //     focusColor: Colors.deepPurple,
                        //     focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(8),
                        //         borderSide: const BorderSide(
                        //           color: Colors.deepPurple,
                        //           width: 2,
                        //         )),
                        //     labelText: 'Enter your upi',
                        //     border: OutlineInputBorder(
                        //         borderSide:
                        //             const BorderSide(color: Colors.deepPurple),
                        //         borderRadius: BorderRadius.circular(8)),
                        //   ),
                        //   onChanged: (text) {
                        //     setState(() {
                        //       isUpiValid = upiPattern.hasMatch(text);
                        //     });
                        //   },
                        // ),
                        18.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
