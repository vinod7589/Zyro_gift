import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  TextEditingController referral = TextEditingController();
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
              'Account Details',
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF454545)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Raza Rameez',
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF454545)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Number',
                    style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '9876543210',
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 20),
              width: double.infinity,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF454545)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email address',
                    style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'rameezraza@gmail.com',
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 100,
              child: TextFormField(
                controller: referral,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFF454545)),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                          right: 25, left: 12, bottom: 12, top: 12),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                decoration: BoxDecoration(
                                    color: Color(0xFF2C2C2C),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12))),
                                // Customize the content of your bottom sheet here
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 12),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF444444),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              height: 5,
                                              width: 100,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Referral Code',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.40,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Referral Code is shared by your friend or family who recommended Zyro Gift to you ',
                                          style: TextStyle(
                                            color: Color(0xFFCDCDCD),
                                            fontSize: 11,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.22,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          child: TextFormField(
                                            controller: referral,
                                            style:
                                                TextStyle(color: Colors.white),
                                            maxLength: 8,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC7C7C7),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC7C7C7),
                                                  ),
                                                ),
                                                hintStyle: const TextStyle(
                                                  color: Color(0xFFBEBEBE),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.29,
                                                ),
                                                hintText: "Enter referral Code",
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFC7C7C7),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                )),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                height: 51,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF2C2C2C),
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.11,
                                                        letterSpacing: 0.08,
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/images/addimage.png',
                          height: 10,
                        ),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 22, top: 26, bottom: 26),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFF454545)),
                    ),
                    hintStyle: const TextStyle(
                      color: Color(0xFFA2A2A2),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.29,
                    ),
                    hintText: "Referral Code",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFC7C7C7),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
          ]),
        ));
  }
}
