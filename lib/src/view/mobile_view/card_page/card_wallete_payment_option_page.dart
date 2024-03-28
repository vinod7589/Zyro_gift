import 'package:abc/src/constants/page_padding.dart';
import 'package:abc/src/view/widgets/textfield_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWalletePaymentOptionPage extends StatefulWidget {
  const CardWalletePaymentOptionPage({super.key});

  @override
  State<CardWalletePaymentOptionPage> createState() =>
      _CardWalletePaymentOptionPageState();
}

class _CardWalletePaymentOptionPageState
    extends State<CardWalletePaymentOptionPage>
    with SingleTickerProviderStateMixin {
  List<String> selectedPaymentImage = [
    'assets/images/gpay.png',
    'assets/images/phonepay.png',
    'assets/images/paytm-1.png',
  ];
  List<String> selectedPaymentName = [
    'Google Pay',
    'PhonePe UPI',
    'PayTm',
  ];
  int selectedPaymentMethod = 0;
  bool isUpiExpanded = false;
  late AnimationController dropDownController;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    dropDownController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dropDownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
            Text('Payment Option'),
            5.verticalSpace,
            Text(
              'Total : 2,375',
              style: TextStyle(
                color: Color(0xFFE0E0E0),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.07,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UPI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.08,
              ),
            ),
            InkWell(
              onTap: () {
                isUpiExpanded = !isUpiExpanded;
                setState(() {});
              },
              child: AnimatedContainer(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                duration: const Duration(microseconds: 300),
                decoration: ShapeDecoration(
                  color: const Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 43,
                          height: 43,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF313131),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 24,
                            height: 15,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            child: Text(
                              'UPI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.78.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        8.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UPI',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.80.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            5.verticalSpace,
                            Text(
                              'Pay by any UPI App',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF767676),
                                fontSize: 11.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.15,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        AnimatedIcon(
                          icon: isUpiExpanded
                              ? AnimatedIcons.arrow_menu
                              : AnimatedIcons.menu_close,
                          color: Colors.white,
                          progress: dropDownController,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: isUpiExpanded
                                ? Icon(
                                    Icons.keyboard_arrow_up_sharp,
                                    color: Colors.white,
                                    size: 35,
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                      ],
                    ),
                    if (isUpiExpanded) ...{
                      ListView.separated(
                          padding: const EdgeInsets.only(
                              top: 15, left: 20, right: 20, bottom: 30),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return index < 3
                                ? InkWell(
                                    onTap: () {
                                      setState(() {});
                                      selectedPaymentMethod = index;
                                      if (kDebugMode) {
                                        print(selectedPaymentName[
                                            selectedPaymentMethod]);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 16.40,
                                          height: 16.40,
                                          decoration: ShapeDecoration(
                                            color:
                                                selectedPaymentMethod == index
                                                    ? Colors.white
                                                    : Colors.transparent,
                                            shape: OvalBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFD0D0D0)),
                                            ),
                                          ),
                                        ),
                                        14.horizontalSpace,
                                        Image.asset(
                                          selectedPaymentImage[index],
                                          height: 47,
                                        ),
                                        13.horizontalSpace,
                                        Text(
                                          selectedPaymentName[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.80.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.44,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {});
                                      selectedPaymentMethod = index;
                                      if (kDebugMode) {
                                        print("enter upi id");
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        30.verticalSpace,
                                        Row(
                                          children: [
                                            Container(
                                              width: 16.40,
                                              height: 16.40,
                                              decoration: ShapeDecoration(
                                                color: selectedPaymentMethod ==
                                                        index
                                                    ? Colors.white
                                                    : Colors.transparent,
                                                shape: OvalBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFD0D0D0)),
                                                ),
                                              ),
                                            ),
                                            18.horizontalSpace,
                                            Text(
                                              'Enter your UPI ID',
                                              style: TextStyle(
                                                color: Color(0xFFDFDFDF),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        16.verticalSpace,
                                        AppTextField(
                                          fillColor: Color(0xFF1E1E1E),
                                          borderColor: Color(0xFF2D2D2D),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )
                                      ],
                                    ),
                                  );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: 4)
                    }
                  ],
                ),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
