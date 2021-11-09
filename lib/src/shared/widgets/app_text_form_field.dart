import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.label,
    this.keyboardType,
    this.obscureText,
    this.textInputAction,
    this.validator,
    this.suffix,
    this.controller,
  });

  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.textBoxFillColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          width: double.infinity,
          height: 20,
        ),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText ?? false,
          cursorColor: AppColors.lightOrange,
          decoration: InputDecoration(
            suffixIcon: suffix,
            alignLabelWithHint: false,
            contentPadding:
                EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            labelText: label,
            floatingLabelStyle: textTheme.bodyText2!.copyWith(
              fontSize: 14,
              color: AppColors.textLightGrey,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: '',
            filled: true,
            fillColor: AppColors.textBoxFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
