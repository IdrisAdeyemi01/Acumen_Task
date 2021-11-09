import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    this.suffix,
    this.prefix,
  });
  final Widget? suffix;
  final Widget? prefix;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.lightOrange,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: prefix,
        contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        hintText: hintText,
        filled: true,
        fillColor: AppColors.textBoxFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
