import 'package:flutter/material.dart';

import '../../domain/entities/callbackModel.dart';

requestButton({
  required double fontSize,
  required double verticalPadding,
  required double  horizontalPadding,
  required Function  onTap,
}){
  return  ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFfc012a),
      padding:   EdgeInsets.symmetric(
          vertical: verticalPadding,
          // 18 ,24
          horizontal: horizontalPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
    onPressed: () {
      onTap();
    },

    child:   Text(
      "Submit Request",
      style: TextStyle(
          // 16
          fontSize: fontSize, color: Colors.white),
    ),
  );
}