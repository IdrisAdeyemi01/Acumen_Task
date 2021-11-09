import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/utilities/screen_util.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.height,
    this.width,
    this.isLoading = false,
  });
  final Function() onPressed;
  final String label;
  final double? height;
  final double? width;
  final bool isLoading;

  const AppElevatedButton.small({
    required this.onPressed,
    required this.label,
    this.height = 40.0,
    this.width = 80.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
            colors: isLoading
                ? [AppColors.grey, AppColors.grey]
                : [AppColors.lightOrange, AppColors.orange],
            stops: [0.5, 1.0],
            begin: Alignment.centerLeft),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            width ?? ScreenUtil.screenWidth(context),
            height ?? 58,
          ),
          elevation: 0,
          primary: AppColors.transparent,
        ),
        child: FittedBox(child: Text(isLoading ? 'Loading...' : label)),
      ),
    );
  }
}
