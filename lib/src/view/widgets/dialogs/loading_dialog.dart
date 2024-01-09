import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/color.dart';

void showLoading(BuildContext context, {String? message}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(

        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
            child: SpinKitCubeGrid(

          // color: primary,
              duration: const Duration(milliseconds: 500),
          size: 50.0,
          itemBuilder: (context, index) {
            final colors = [primary, purple];
            final color = colors[index % colors.length];
            return DecoratedBox(decoration: BoxDecoration(color: color));
          },
          // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)
        )),
      );
    },
  );
}

showLoaderDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}
