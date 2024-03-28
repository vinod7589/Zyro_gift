import 'package:abc/src/constants/height.dart';
import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/widgets/botton_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ManageTransactionsPage extends StatefulWidget {
  const ManageTransactionsPage({super.key});

  @override
  State<ManageTransactionsPage> createState() => _ManageTransactionsPageState();
}

class _ManageTransactionsPageState extends State<ManageTransactionsPage> {
  /// <--------------ToggleController-------------->
  bool onlineShoppingToggle = true;
  bool tapToPayToggle = false;
  bool pointOfSaleToggle = false;
  bool atmWithdrawalsToggle = true;

  /// ////////////////////////////////
  double onlineShoppingLimit = 5.0;
  double tapToPayLimit = 0.0;
  double pointOfSaleLimit = 10.0;
  double atmWithdrawalLimit = 0.0;

  /// <--------------isExpandedContainer-------------->
  // bool onlineShoppingExpanded = false;
  // bool tapToPayExpanded = false;
  // bool pointSaleExpanded = false;
  // bool atmWithdrawalExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.verticalSpace,
          AnimationButton(
            title: 'Continue',
            width: Height.ButtonWidth,
          ),
          15.verticalSpace,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Issued by',
                  style: TextStyle(
                    color: Color(0xFFBEBEBE),
                    fontSize: 9.64,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.13,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: Color(0xFFBEBEBE),
                    fontSize: 12.05,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                ),
                TextSpan(
                  text: 'Pine Labs',
                  style: TextStyle(
                    color: Color(0xFF0E761E),
                    fontSize: 12.05,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                ),
              ],
            ),
          ),
          15.verticalSpace,
        ],
      ),
      appBar: AppBar(
        toolbarHeight: 65,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Padding(
          padding: const EdgeInsets.only(top: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set Usage Limit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEDEDED),
                  fontWeight: FontWeight.w500,
                ),
              ),
              6.verticalSpace,
              const Text(
                'ZYRO | XXXX XXXX 0540',
                style: TextStyle(
                  color: Color(0xFF8F8F8F),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,

              /// Online Shopping/////////

              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: ShapeDecoration(
                  color: const Color(0xFF212121),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xFF313131), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/images/bill-payments/bag.svg',
                          ),
                        ),
                        18.horizontalSpace,
                        Text(
                          'Online Shopping',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFEDEDED),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: onlineShoppingToggle,
                          activeColor: Colors.white,
                          trackOutlineColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          // thumbIcon: MaterialStatePropertyAll(
                          //     Icon(Icons.swap_horizontal_circle)),
                          activeTrackColor: const Color(0xFF5801B7),
                          focusColor: Colors.red,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              onlineShoppingToggle = value;
                            });
                          },
                        ),
                      ],
                    ),
                    if (onlineShoppingToggle) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            const Divider(
                              color: Color(0xFF303030),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Per Transaction Limit',
                                  style: TextStyle(
                                    color: const Color(0xFFADADAD),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(right: 16),
                                  alignment: Alignment.centerRight,
                                  width: 116,
                                  height: 37,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFF696969)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    '₹ 20,000',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: const Color(0xFFDEDEDE),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            21.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Text(
                                    '₹0K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹10K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹20K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SfSlider(
                              min: 0.0,
                              max: 10.0,
                              value: onlineShoppingLimit,
                              interval: 5,
                              stepSize: 5,
                              // showTicks: false,
                              // enableTooltip: false,
                              // shouldAlwaysShowTooltip: false,
                              // showDividers: false,
                              // showLabels: false,
                              // thumbIcon: Icon(
                              //   Icons.circle,
                              //   color: Colors.white,
                              // ),
                              // showTicks: true,
                              // showLabels: true,
                              // enableTooltip: true,
                              // showDividers: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  onlineShoppingLimit = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    }
                  ],
                ),
              ),
              15.verticalSpace,

              /// Tap To Pay/////////

              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: ShapeDecoration(
                  color: const Color(0xFF212121),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xFF313131), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/images/bill-payments/tap-to-pay.svg',
                          ),
                        ),
                        18.horizontalSpace,
                        Text(
                          'Tap and Pay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFEDEDED),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: tapToPayToggle,
                          activeColor: Colors.white,
                          trackOutlineColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          // thumbIcon: MaterialStatePropertyAll(
                          //     Icon(Icons.swap_horizontal_circle)),
                          activeTrackColor: const Color(0xFF5801B7),
                          focusColor: Colors.red,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              tapToPayToggle = value;
                            });
                          },
                        ),
                      ],
                    ),
                    if (tapToPayToggle) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            const Divider(
                              color: Color(0xFF303030),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Per Transaction Limit',
                                  style: TextStyle(
                                    color: const Color(0xFFADADAD),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(right: 16),
                                  alignment: Alignment.centerRight,
                                  width: 116,
                                  height: 37,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFF696969)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    '₹ 20,000',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: const Color(0xFFDEDEDE),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            21.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Text(
                                    '₹0K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹10K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹20K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SfSlider(
                              min: 0.0,
                              max: 10.0,
                              value: tapToPayLimit,
                              interval: 5,
                              stepSize: 5,
                              // showTicks: false,
                              // enableTooltip: false,
                              // shouldAlwaysShowTooltip: false,
                              // showDividers: false,
                              // showLabels: false,
                              // thumbIcon: Icon(
                              //   Icons.circle,
                              //   color: Colors.white,
                              // ),
                              // showTicks: true,
                              // showLabels: true,
                              // enableTooltip: true,
                              // showDividers: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  tapToPayLimit = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    }
                  ],
                ),
              ),
              15.verticalSpace,

              /// Point Of Sale/////////

              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: ShapeDecoration(
                  color: const Color(0xFF212121),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xFF313131), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/images/bill-payments/point-sale.svg',
                          ),
                        ),
                        18.horizontalSpace,
                        Text(
                          'Point of Sale (POS)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFEDEDED),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: pointOfSaleToggle,
                          activeColor: Colors.white,
                          trackOutlineColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          // thumbIcon: MaterialStatePropertyAll(
                          //     Icon(Icons.swap_horizontal_circle)),
                          activeTrackColor: const Color(0xFF5801B7),
                          focusColor: Colors.red,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              pointOfSaleToggle = value;
                            });
                          },
                        ),
                      ],
                    ),
                    if (pointOfSaleToggle) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            const Divider(
                              color: Color(0xFF303030),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Per Transaction Limit',
                                  style: TextStyle(
                                    color: const Color(0xFFADADAD),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(right: 16),
                                  alignment: Alignment.centerRight,
                                  width: 116,
                                  height: 37,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFF696969)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    '₹ 20,000',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: const Color(0xFFDEDEDE),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            21.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Text(
                                    '₹0K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹10K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹20K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SfSlider(
                              min: 0.0,
                              max: 10.0,
                              value: pointOfSaleLimit,
                              interval: 5,
                              stepSize: 5,
                              // showTicks: false,
                              // enableTooltip: false,
                              // shouldAlwaysShowTooltip: false,
                              // showDividers: false,
                              // showLabels: false,
                              // thumbIcon: Icon(
                              //   Icons.circle,
                              //   color: Colors.white,
                              // ),
                              // showTicks: true,
                              // showLabels: true,
                              // enableTooltip: true,
                              // showDividers: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  pointOfSaleLimit = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    }
                  ],
                ),
              ),

              15.verticalSpace,

              /// ATM Withdrawal/////////

              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                decoration: ShapeDecoration(
                  color: const Color(0xFF212121),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xFF313131), shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            'assets/images/bill-payments/atm-withdrawals.svg',
                          ),
                        ),
                        18.horizontalSpace,
                        Text(
                          'ATM Withdrawals',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFFEDEDED),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: atmWithdrawalsToggle,
                          activeColor: Colors.white,
                          trackOutlineColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          // thumbIcon: MaterialStatePropertyAll(
                          //     Icon(Icons.swap_horizontal_circle)),
                          activeTrackColor: const Color(0xFF5801B7),
                          focusColor: Colors.red,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              atmWithdrawalsToggle = value;
                            });
                          },
                        ),
                      ],
                    ),
                    if (atmWithdrawalsToggle) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            const Divider(
                              color: Color(0xFF303030),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  'Per Transaction Limit',
                                  style: TextStyle(
                                    color: const Color(0xFFADADAD),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(right: 16),
                                  alignment: Alignment.centerRight,
                                  width: 116,
                                  height: 37,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: Color(0xFF696969)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    '₹ 20,000',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: const Color(0xFFDEDEDE),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            21.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Text(
                                    '₹0K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹10K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹20K',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF696969),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SfSlider(
                              min: 0.0,
                              max: 10.0,
                              value: atmWithdrawalLimit,
                              interval: 5,
                              stepSize: 5,
                              // showTicks: false,
                              // enableTooltip: false,
                              // shouldAlwaysShowTooltip: false,
                              // showDividers: false,
                              // showLabels: false,
                              // thumbIcon: Icon(
                              //   Icons.circle,
                              //   color: Colors.white,
                              // ),
                              // showTicks: true,
                              // showLabels: true,
                              // enableTooltip: true,
                              // showDividers: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  atmWithdrawalLimit = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    }
                  ],
                ),
              ),
              15.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
