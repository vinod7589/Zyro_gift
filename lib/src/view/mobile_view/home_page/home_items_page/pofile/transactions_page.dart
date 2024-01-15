import 'dart:convert';

import 'package:abc/src/infrastructure/repository/drawer_repo.dart';
import 'package:abc/src/model/drawer_model/transaction_history_model.dart';
import 'package:abc/src/view/widgets/dialogs/skletonLoader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/dialogs/loading_dialog.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Transaction> transactionList = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    transactionList = await DrawerRepoService.getTransactionHistory("") ?? [];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
          actions: [
            // IconButton(
            //     onPressed: () {
            //     //   Navigator.push(context,
            //     //       MaterialPageRoute(builder: (context) => SkletonLoader()));
            //     // },
            //     icon: Icon(Icons.next_plan_outlined))
          ],
          scrolledUnderElevation: 0,
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
      body: ListView.builder(
          padding: const EdgeInsets.only(left: 35, right: 35),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index < transactionList.length) {
              // GetTransactions_model res = GetTransactions_model();
              return Column(
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
                                    transactionList[index]
                                            .brandName
                                            ?.toString() ??
                                        "",
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
                                    transactionList[index].ondate?.toString() ??
                                        "",
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
                                text: transactionList[index]
                                        .totalTransAmount
                                        ?.toString() ??
                                    "",
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
                ],
              );
            }
          },
          // },
          itemCount: transactionList.length + 1),
    );
  }
}
