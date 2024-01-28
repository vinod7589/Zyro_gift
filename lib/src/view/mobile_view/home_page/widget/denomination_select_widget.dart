// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:developer';

import 'package:abc/src/model/CartDataModel.dart';
import 'package:abc/src/util/services/shared_preferences.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/mobile_view/payment_option_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/fixed_card_controller.dart';
import '../../../../infrastructure/repository/checkli_maxlit_repo.dart';
import '../home_items_page/card_details_page.dart';
import 'Home_globalPage.dart';

class Denomination extends ConsumerStatefulWidget {
  const Denomination(
    this.brandCode,
    this.discount, {
    super.key,
    required this.availableLimit,
  });

  final num discount;
  final num availableLimit;

  final String brandCode;
  @override
  ConsumerState<Denomination> createState() => _DenominationState();
}

class _DenominationState extends ConsumerState<Denomination> {
  @override
  void initState() {
    super.initState();
    print(widget.availableLimit);
  }

  // num? availableLimit;
  int current_net_value = 0;

  @override
  Widget build(BuildContext context) {
    var fixedCardProvider = ref.watch(fixedCardController(widget.brandCode));
    return fixedCardProvider.isLoading
        ? CircularProgressIndicator()
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFFEFEFEF),
                  thickness: 2,
                ),
            itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        24.verticalSpace,
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
                      ],
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      width: double.infinity,
                      height: 210.h,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade800.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFF494949),
                          )),
                      child: Column(
                        children: [
                          // Text("Available limit: asdf"),
                          28.verticalSpace,
                          Image.network(
                            "$baseUrl${fixedCardProvider.brandDetails!.image.toString()}",
                            height: 40.h,
                          ),
                          14.verticalSpace,
                          const Text(
                            'Card worth',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.06,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.24,
                            ),
                          ),
                          5.verticalSpace,
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
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
                                  text: fixedCardProvider.totalCardWorth
                                      .toString()
                                      .replaceAll(regex, ''),
                                  // '${homePage.getTotalamount().toString().replaceAll(homePage.regex, '')}',
                                  style: const TextStyle(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '. . . .',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Zyro Gifts',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.50.sp,
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
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.availableLimit >=
                                  fixedCardProvider.totalCardWorth
                              ? ""
                              : 'You have a maximum limit of ${widget.availableLimit}.',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // AddMoney addMoney = homePage.amount[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //
                              children: [
                                Text(
                                  '₹ ' +
                                      fixedCardProvider
                                          .denominationOption[index]
                                          .toString()
                                          .replaceAll(regex, ''),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.08,
                                  ),
                                ),
                                Container(
                                    height: 35,
                                    width: 113,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            onPressed: () {
                                              if ((fixedCardProvider
                                                              .denominationVariant[
                                                          fixedCardProvider
                                                                  .denominationOption[
                                                              index]] ??
                                                      0) >
                                                  0) {
                                                fixedCardProvider
                                                    .removeDenominationInCart(
                                                        index);
                                              }
                                              setState(() {});
                                              //
                                              // homePage.decreaseNumber(
                                              //     double, index);
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 0),
                                          child: SizedBox(
                                            width: 15,
                                            child: Text(
                                              fixedCardProvider
                                                              .denominationVariant[
                                                          fixedCardProvider
                                                                  .denominationOption[
                                                              index]] ==
                                                      null
                                                  ? "0"
                                                  : fixedCardProvider
                                                      .denominationVariant[
                                                          fixedCardProvider
                                                                  .denominationOption[
                                                              index]]
                                                      .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: fixedCardProvider
                                                                .denominationVariant[
                                                                    fixedCardProvider
                                                                            .denominationOption[
                                                                        index]]
                                                                .toString() ==
                                                            "0" ||
                                                        fixedCardProvider
                                                                .denominationVariant[
                                                                    fixedCardProvider
                                                                            .denominationOption[
                                                                        index]]
                                                                .toString() ==
                                                            "null"
                                                    ? Colors.white
                                                    : const Color(0xFFAD62FF),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.27,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.only(),
                                            onPressed: () {
                                              fixedCardProvider
                                                  .addDenominationInCart(index);
                                              setState(() {});
                                              // homePage.increaseNumber(
                                              //     double, index);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: fixedCardProvider.denominationOption.length),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print(fixedCardProvider.totalCardWorth);
                            if (widget.availableLimit >=
                                fixedCardProvider.totalCardWorth) {
                              var vouchers = [];
                              fixedCardProvider.denominationVariant.entries
                                  .forEach((element) {
                                if (element.value > 0) {
                                  var req = {
                                    "qty": element.value,
                                    "amount": element.key
                                  };
                                  vouchers.add(req);
                                }
                              });
                              var final_request = {
                                "userId": UserPreferences.userId,
                                "brandcode": widget.brandCode,
                                "discount": widget.discount,
                                "vouchers": vouchers
                              };
                              //print(json.encode(final_request));
                              CartDataModel cart =
                                  CartDataModel.fromJson(final_request);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentOptionPage(
                                            cartDataDetails: cart,
                                            brandCode: widget.brandCode,
                                          )));
                            } else {}
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 320.w,
                            height: 51.h,
                            decoration: ShapeDecoration(
                              color: widget.availableLimit >=
                                      fixedCardProvider.totalCardWorth
                                  ? Colors.white
                                  : Colors.black87,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF8C8C8C)),
                                borderRadius: BorderRadius.circular(66),
                              ),
                            ),
                            child: const Text(
                              'Proceed',
                              style: TextStyle(
                                color: Color(0xFF2C2C2C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.08,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                  ],
                ));
  }
}
