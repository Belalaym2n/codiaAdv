import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(
    String label,
    TextEditingController controller, {
      int maxLines = 1,
      String? Function(String?)? validator,  // دالة للتحقق من الإدخال

    }) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator:validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}