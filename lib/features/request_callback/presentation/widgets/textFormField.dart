import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/utils/appColors.dart';
Widget buildInput({
  required String hint,
  required IconData icon,
  required TextEditingController controller,
  String? Function(String?)? validator,  // دالة للتحقق من الإدخال
  int maxLines = 1,
}) {
  return TextFormField(
    controller: controller,
    maxLines: maxLines,
    cursorColor: AppColors.primaryColor,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    validator: validator,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
      ),
      prefixIcon: Icon(icon, color: Colors.grey[700], size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFfc012a), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    ),
  );
}
