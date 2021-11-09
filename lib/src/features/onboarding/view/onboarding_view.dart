import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:acumen_task/src/content/utilities/app_images.dart';
import 'package:acumen_task/src/content/utilities/screen_util.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/shared/routing/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:acumen_task/src/shared/widgets/app_elevated_button.dart';
import 'package:acumen_task/src/shared/widgets/spacing.dart';
import 'package:acumen_task/src/shared/widgets/status_bar.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StatusBar(
      systemNavigationBarColor: AppColors.onboardingBottomBlack,
      systemNavigationBarIconBrightness: Brightness.light,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 30),
                height: ScreenUtil.screenHeight(context) * 0.7,
                width: ScreenUtil.screenWidth(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.onboardingImage),
                    fit: BoxFit.fill,
                  ),
                  // color: AppColors.black,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.wooDogLogo,
                          ),
                          FittedBox(
                            child: Column(
                              children: [
                                Text(
                                  AppStrings.woo,
                                  style: textTheme.headline4!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                    color: AppColors.wooDogTextColor,
                                    wordSpacing: 0,
                                  ),
                                ),
                                Text(
                                  AppStrings.dog,
                                  style: textTheme.headline4!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                    color: AppColors.wooDogTextColor,
                                    wordSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Text(
                            '1',
                            style: textTheme.bodyText2,
                          ),
                          radius: 15,
                          backgroundColor: AppColors.white,
                        ),
                        Spacing.smallWidth(),
                        SizedBox(
                          width: 10,
                          child: Divider(
                            color: AppColors.white,
                            height: 10,
                            thickness: 2,
                          ),
                        ),
                        Spacing.smallWidth(),
                        CircleAvatar(
                          child: Text(
                            '2',
                            style: textTheme.bodyText2!
                                .copyWith(color: AppColors.white),
                          ),
                          radius: 15,
                          backgroundColor: AppColors.black,
                        ),
                        Spacing.smallWidth(),
                        SizedBox(
                          width: 10,
                          child: Divider(
                            color: AppColors.white,
                            thickness: 2,
                          ),
                        ),
                        Spacing.smallWidth(),
                        CircleAvatar(
                          child: Text(
                            '3',
                            style: textTheme.bodyText2!
                                .copyWith(color: AppColors.white),
                          ),
                          radius: 15,
                          backgroundColor: AppColors.black,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.only(right: 30, left: 30),
              width: ScreenUtil.screenWidth(context),
              color: AppColors.onboardingBottomBlack,
              child: Column(
                children: [
                  Text(
                    AppStrings.onboardingLabel,
                    textAlign: TextAlign.center,
                    style: textTheme.headline3!.copyWith(
                      fontSize: 22,
                      color: AppColors.white,
                    ),
                  ),
                  Spacing.largeHeight(),
                  AppElevatedButton(
                    label: AppStrings.joinOurCommunity,
                    onPressed: () {
                      context.read(navigationService).toNamed(Routes.signup);
                    },
                  ),
                  Spacing.bigHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.alreadyAMember,
                        style: textTheme.bodyText2!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read(navigationService)
                              .toNamed(Routes.signin);
                        },
                        child: Text(
                          AppStrings.signin,
                          style: textTheme.bodyText2!.copyWith(
                            color: AppColors.textOrange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
