import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:flutter/material.dart';

class AgreementStatement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: AppStrings.bySigningUp,
            style:
                textTheme.bodyText2!.copyWith(color: AppColors.textNormalGrey),
            children: [
              TextSpan(
                text: AppStrings.termsOfUse,
                style: textTheme.bodyText2,
              ),
              TextSpan(
                text: AppStrings.and,
                style: textTheme.bodyText2!
                    .copyWith(color: AppColors.textNormalGrey),
              ),
              TextSpan(
                text: AppStrings.privacyPolicy,
                style: textTheme.bodyText2,
              )
            ]),
      ),
    );
  }
}
