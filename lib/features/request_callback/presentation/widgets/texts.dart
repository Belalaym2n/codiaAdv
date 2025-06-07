import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget requestCallbackHeadline({
  required double fontSize
}){
  return Text(
    "Request a Callback",
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF252c49),
    ),
  );
}

Widget requestCallbackDescription({
  required double fontSize
}){
  return Text(
    "At CodiaAdv, we believe in direct communication. "
        "Whether you have a question, a project idea, or you just want to talk to someone from our team — "
        "leave your contact info below and we’ll get back to you shortly.",
    style: TextStyle(
      fontSize: fontSize,
      height: 1.8,
      color: AppColors.lightBlack,
    ),
  );
}