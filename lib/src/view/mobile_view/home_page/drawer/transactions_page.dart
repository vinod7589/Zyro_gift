import 'dart:convert';

import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/transaction_history_model.dart';
import 'package:abc/src/view/Utility/constants.dart';
import 'package:abc/src/view/widgets/dialogs/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Packages/loading_packags/build_loading_animation.dart';
import '../../../../controller/internet_check_status_controller.dart';
import '../../../widgets/dialogs/loading_dialog.dart';
import '../../no_internet_page.dart';

class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({super.key});

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  DrawerRepoService drawerRepo = DrawerRepoService();

  List<Transaction> transactionList = [];
  List<Transaction> searchTransactionList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(CheckInternetController.notifier).startStreaming();
      fetch();
    });
  }

  Future<void> fetch() async {
    isLoading = true; // Set fetching to true
    transactionList = await drawerRepo.getTransactionHistory("") ?? [];
    searchTransactionList = List.from(transactionList);
    isLoading = false;
    setState(() {});
  }

  bool isLoading = true;
  bool isDisable = false;

  @override
  Widget build(BuildContext context) {
    var checkInternetController = ref.watch(CheckInternetController);
    return checkInternetController.isConnected
        ? Scaffold(
            backgroundColor: Color.fromRGBO(35, 35, 35, 1),
            appBar: AppBar(
                actions: [
                  isDisable
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: constants.searchBarHeight,
                              child: TextFormField(
                                autofocus: true,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white.withOpacity(0.5)),
                                    hintText: 'Search Brands',
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isDisable = false;
                                            searchController.clear();
                                            searchTransactionList.clear();
                                            fetch();
                                          });
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                        )),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 20),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                                onChanged: (value) {
                                  setState(() {
                                    searchTransactionList = transactionList
                                        .where((transaction) =>
                                            transaction.brandName
                                                .toLowerCase()
                                                .contains(
                                                    value.toLowerCase()) ||
                                            transaction.type
                                                .toLowerCase()
                                                .contains(
                                                    value.toLowerCase()) ||
                                            transaction.totalTransAmount
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                        .toList();
                                  });
                                },
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isDisable = true;
                            });
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ))
                ],
                scrolledUnderElevation: 0,
                titleSpacing: 5,
                leading: isDisable
                    ? Text('')
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                backgroundColor: Color.fromRGBO(35, 35, 35, 1),
                title: Text(
                  'Transactions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 1.11,
                    letterSpacing: 0.08,
                  ),
                )),
            body: isLoading
                ? Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.white,
                      size: 50,
                    ),
                  )
                : (transactionList.isEmpty)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/notransactionsfound.png',
                                height: 295,
                              ),
                            ],
                          ),
                          23.verticalSpace,
                          Text(
                            textAlign: TextAlign.center,
                            "It appears that you haven't made any\n transactions so far!",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          58.verticalSpace,
                          Container(
                            height: 51.h,
                            width: 162.w,
                            child: ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Back',
                                style: TextStyle(
                                    color: Color(0xFE2D2D2D),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index < searchTransactionList.length) {
                            // GetTransactions_model res = GetTransactions_model();
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 10, top: 10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Center(
                                                child: Image.asset(
                                                  'assets/images/card2.png',
                                                  height: 36.h,
                                                ),
                                              ),
                                            ),
                                            15.horizontalSpace,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  transactionList[index]
                                                          .brandName
                                                          ?.toString() ??
                                                      "",
                                                  style: TextStyle(
                                                    color: Color(0xFFF0F0F0),
                                                    fontSize: 15.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.29,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  transactionList[index]
                                                          .ondate
                                                          ?.toString() ??
                                                      "",
                                                  style: TextStyle(
                                                    color: Color(0xFFA2A2A2),
                                                    fontSize: 13.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '₹ ' +
                                            transactionList[index]
                                                .totalTransAmount
                                                .toString(),
                                        style: TextStyle(
                                          color: Color(0xFFF0F0F0),
                                          fontSize: 16.sp,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.32,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      transactionList[index].status,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color:
                                              transactionList[index].status ==
                                                      'SUCCESS'
                                                  ? Colors.transparent
                                                  : Colors.orange),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Color(0xFF303030),
                                ),
                              ],
                            );
                          }
                        },
                        // },
                        itemCount: transactionList.length),
          )
        : NoInternetPage(() {
            isLoading = true;
            fetch();
            isLoading = false;
          }, context);
  }
}