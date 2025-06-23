import 'package:flutter/material.dart';

Widget seeAllDetailsButton({
  required String name,
  required VoidCallback navigate,
}){
  return  ElevatedButton.icon(
    onPressed: () {
      navigate();
      // TODO: Navigate to all blogs page
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 10,
      shadowColor: Colors.black54,
    ),
    icon: const Icon(
      Icons.arrow_forward_ios_rounded,
      size: 22,
    ),
    label:   Text(
      name,

      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
  );
}