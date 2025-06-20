import 'package:flutter/material.dart';

InputDecoration buildInputDecoration({
  required BuildContext context,
  required String hintText,
  required IconData prefixIconData,
  required Color primaryColor,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    prefixIcon: Icon(prefixIconData, color: primaryColor, size: 22),
    hintText: hintText,
    filled: true,
    fillColor: Colors.grey[50],
    contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.grey[300]!),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.grey[300]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: primaryColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),
    suffixIcon: suffixIcon,
  );
}
