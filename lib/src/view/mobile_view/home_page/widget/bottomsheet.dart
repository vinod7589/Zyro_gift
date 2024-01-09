import 'package:flutter/material.dart';

Widget bottomSheets({
  required Function() increaseNumber,
  required Function() decreaseNumber,
  required int addNumber,
  required String price,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //
    children: [
      Text(
        '₹ ' + price.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          letterSpacing: 0.08,
        ),
      ),
      Container(
          alignment: Alignment.center,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.white)),
          child: Row(
            children: [
              IconButton(
                  padding: EdgeInsets.only(right: 0),
                  onPressed: decreaseNumber,
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: Text(
                  addNumber.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFAD62FF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.27,
                  ),
                ),
              ),
              IconButton(
                  padding: EdgeInsets.only(),
                  onPressed: increaseNumber,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
            ],
          ))
    ],
  );
}
