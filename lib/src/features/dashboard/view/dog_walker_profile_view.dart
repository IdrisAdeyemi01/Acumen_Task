import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:acumen_task/src/content/utilities/screen_util.dart';
import 'package:acumen_task/src/features/dashboard/model/dog_walkers_model.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/shared/widgets/app_elevated_button.dart';
import 'package:acumen_task/src/shared/widgets/spacing.dart';
import 'package:acumen_task/src/shared/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DogWalkerProfileView extends HookWidget {
  const DogWalkerProfileView({
    required this.walker,
  });

  final DogWalkers walker;

  @override
  Widget build(BuildContext context) {
    final currentChipIndex = useState(0);
    final textTheme = Theme.of(context).textTheme;
    return StatusBar(
      child: Scaffold(
        body: Container(
          height: ScreenUtil.screenHeight(context),
          width: ScreenUtil.screenWidth(context),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: ScreenUtil.screenHeight(context) * 0.5,
                child: Image.asset(
                  walker.imageString!,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 15,
                top: 40,
                child: InkWell(
                  onTap: () => context.read(navigationService).back(),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.clear,
                      size: 20,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 15,
                top: 40,
                child: Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.verified,
                        style: textTheme.bodyText2!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacing.tinyWidth(),
                      Icon(
                        IconlyBold.tick_square,
                        size: 15,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: ScreenUtil.screenHeight(context) * 0.4,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  height: ScreenUtil.screenHeight(context) * 0.6,
                  width: ScreenUtil.screenWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            walker.name!,
                            style: textTheme.headline1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${walker.chargeRate}\$',
                                  style: textTheme.bodyText2!
                                      .copyWith(color: AppColors.black),
                                ),
                                Text('/hr')
                              ],
                            ),
                            Spacing.smallWidth(),
                            Text('|'),
                            Spacing.smallWidth(),
                            Row(
                              children: [
                                Text(
                                  '${walker.distance}',
                                  style: textTheme.bodyText2!
                                      .copyWith(color: AppColors.black),
                                ),
                                Text(' km')
                              ],
                            ),
                            Spacing.smallWidth(),
                            Text('|'),
                            Spacing.smallWidth(),
                            Row(
                              children: [
                                Text(
                                  '${walker.starRating}',
                                  style: textTheme.bodyText2!
                                      .copyWith(color: AppColors.black),
                                ),
                                Icon(
                                  IconlyBold.star,
                                  color: AppColors.grey,
                                  size: 15,
                                )
                              ],
                            ),
                            Spacing.smallWidth(),
                            Text('|'),
                            Spacing.smallWidth(),
                            Row(
                              children: [
                                Text(
                                  '${walker.noOfWalks}',
                                  style: textTheme.bodyText2!
                                      .copyWith(color: AppColors.black),
                                ),
                                Text(' walks')
                              ],
                            ),
                          ],
                        ),
                        Spacing.smallHeight(),
                        Divider(
                          thickness: 1.5,
                        ),
                        Spacing.smallHeight(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                currentChipIndex.value = 0;
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: 44,
                                width: 88,
                                decoration: BoxDecoration(
                                  color: currentChipIndex.value == 0
                                      ? AppColors.black
                                      : AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    AppStrings.about,
                                    style: textTheme.bodyText2!.copyWith(
                                        color: currentChipIndex.value == 0
                                            ? AppColors.white
                                            : AppColors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                currentChipIndex.value = 1;
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: 44,
                                width: 88,
                                decoration: BoxDecoration(
                                  color: currentChipIndex.value == 1
                                      ? AppColors.black
                                      : AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    AppStrings.location,
                                    style: textTheme.bodyText2!.copyWith(
                                        color: currentChipIndex.value == 1
                                            ? AppColors.white
                                            : AppColors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                currentChipIndex.value = 2;
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: 44,
                                width: 88,
                                decoration: BoxDecoration(
                                  color: currentChipIndex.value == 2
                                      ? AppColors.black
                                      : AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    AppStrings.reviews,
                                    style: textTheme.bodyText2!.copyWith(
                                        color: currentChipIndex.value == 2
                                            ? AppColors.white
                                            : AppColors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacing.bigHeight(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.age,
                                ),
                                Spacing.smallHeight(),
                                Text(
                                  '${walker.age} ${AppStrings.thirtyYears}',
                                  style: textTheme.headline4!.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            Spacing.largeWidth(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.experience,
                                ),
                                Spacing.smallHeight(),
                                Text(
                                  '${walker.experience!}',
                                  style: textTheme.headline4!.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacing.largeHeight(),
                        Text(AppStrings.alexProfile),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: Text(
                            AppStrings.readMore,
                            style: textTheme.bodyText2!
                                .copyWith(color: AppColors.lightOrange),
                          ),
                        ),
                        AppElevatedButton(
                          onPressed: () {},
                          label: AppStrings.checkSchedule,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
