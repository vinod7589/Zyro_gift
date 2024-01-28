// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:abc/src/infrastructure/repository/payment_repo.dart';
import 'package:abc/src/model/payment/check_payment_status_model.dart';
import 'package:abc/src/model/payment/payment_model.dart';
import 'package:abc/src/model/payment/purchasegift_voucher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/fixed_card_controller.dart';
import '../../model/CartDataModel.dart';

class PaymentOptionPage extends ConsumerStatefulWidget {
  final CartDataModel cartDataDetails;
  final String brandCode;
  const PaymentOptionPage(
      {super.key, required this.cartDataDetails, required this.brandCode});

  @override
  ConsumerState<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends ConsumerState<PaymentOptionPage> {
  late Timer _timer;
  int _elapsedSeconds = 0;
  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  int f = 0;

  void openPaymentIntent(String psp) async {
    setState(() {
      _elapsedSeconds = 0;
    });
    if (f > 0 && _timer.isActive == true) {
      _timer.cancel();
    }

    String paymentUrl = '';
    String merchantTransactionId = '';
    var paymentOption = ref.watch(fixedCardController(widget.brandCode));
    num payableAmount = paymentOption.totalCardWorth.toInt() -
        (paymentOption.totalCardWorth * widget.cartDataDetails.discount! / 100);
    PaymentModel res = await PaymentRepo.paymentService(payableAmount);

    if (res.success == true) {
      paymentUrl = res.data!.intentUrl!;
      merchantTransactionId = res.data!.merchantTransactionId!;
      if (paymentUrl != '') {
        if (psp == 'phonepe') {
          paymentUrl = paymentUrl.replaceAll('upi://', 'phonepe://');
        } else if (psp == 'googlepay') {
          paymentUrl = paymentUrl.replaceAll('upi://', 'tez://upi/');
        } else if (psp == 'paytm') {
          paymentUrl = paymentUrl.replaceAll('upi://', 'paytmmp://');
        }
        await launchUrl(Uri.parse(paymentUrl));
        _timer =
            Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
          f++;
          if (_elapsedSeconds < 60) {
            // Call your API or perform any task here
            CheckPaymentStatusModel checkStatus =
                await PaymentRepo.checkPaymentStatus(merchantTransactionId);

            if (checkStatus.success == true) {
              // Call Here
              PurchaseGiftVoucherModel purchaseVoucher =
                  await PaymentRepo.purchaseGiftVoucherService(
                      widget.cartDataDetails);

              if (purchaseVoucher.status == 'success') {
                showModalBottomSheet(
                    elevation: 0,
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: const Color(0xFF2C2C2C),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    )),
                    builder: (context) {
                      return StatefulBuilder(builder: (context, f) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              12.verticalSpace,
                              Container(
                                width: 76,
                                height: 5,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF444444),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(91),
                                  ),
                                ),
                              ),
                              20.verticalSpace,
                              Image.asset(
                                'assets/images/successful.png',
                                height: 167,
                              ),
                              20.verticalSpace,
                              const Text(
                                'Your purchase was',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.34,
                                ),
                              ),
                              const Text(
                                'successful',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.40,
                                ),
                              ),
                              30.verticalSpace,
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 110.w,
                                      height: 51.h,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFF8C8C8C)),
                                          borderRadius:
                                              BorderRadius.circular(66),
                                        ),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'View',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.08,
                                        ),
                                      ),
                                    ),
                                    14.horizontalSpace,
                                    Container(
                                      alignment: Alignment.center,
                                      width: 163.w,
                                      height: 51.h,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFF8C8C8C)),
                                          borderRadius:
                                              BorderRadius.circular(66),
                                        ),
                                      ),
                                      child: Text(
                                        'Buy another',
                                        style: TextStyle(
                                          color: const Color(0xFF2C2C2C),
                                          fontSize: 16.sp,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.08,
                                        ),
                                      ),
                                    )
                                  ]),
                              40.verticalSpace,
                            ],
                          ),
                        );
                      });
                    });
              }

              _timer.cancel();
              f = 0;
            } else {
              setState(() {
                _elapsedSeconds += 5;
              });
            }
          } else {
            // If 5 minutes have passed, cancel the timer
            _timer.cancel();
            f = 0;
          }
        });
      } else {
        //Fire Toaster message Payment not enabled
      }
    }
  }

  RegExp upiPattern =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  bool isUpiValid = true;
  final TextEditingController _upiTextEditingController =
      TextEditingController();
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
                          '₹ ${(paymentOption.totalCardWorth)}',
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
                          '₹ ${(paymentOption.totalCardWorth * widget.cartDataDetails.discount! / 100)}',
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
                          '₹ ${paymentOption.totalCardWorth.toInt() - (paymentOption.totalCardWorth * widget.cartDataDetails.discount! / 100)}',
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 5),
                                margin: const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF3A3A3A),
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
                  const Text(
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
                    controller: _upiTextEditingController,
                    style: const TextStyle(color: Colors.white),
                    onTapOutside: (e) => FocusScope.of(context).unfocus(),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      // filled: true,
                      focusColor: Colors.deepPurple,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          )),
                      labelText: 'Enter your upi',
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
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
