import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:acumen_task/src/features/dashboard/model/dog_walkers_model.dart';
import 'package:acumen_task/src/features/dashboard/notifiers/dashboard_notifier.dart';
import 'package:acumen_task/src/features/dashboard/view/dog_walker_profile_view.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/shared/widgets/app_elevated_button.dart';
import 'package:acumen_task/src/shared/widgets/custom_text_field.dart';
import 'package:acumen_task/src/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.home,
                        style: textTheme.headline1,
                      ),
                      FittedBox(
                        child: Text(
                          AppStrings.explore,
                          style: textTheme.headline3!
                              .copyWith(color: AppColors.grey),
                        ),
                      ),
                    ],
                  ),
                  Spacing.smallWidth(),
                  Flexible(
                    child: AppElevatedButton.small(
                      onPressed: () {},
                      label: AppStrings.bookAwalk,
                    ),
                  ),
                ],
              ),
              Spacing.smallHeight(),
              CustomTextField(
                hintText: AppStrings.kiyv,
                prefix: Icon(
                  IconlyLight.location,
                  color: AppColors.iconGrey,
                ),
                suffix: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        IconlyBold.filter,
                        color: AppColors.iconGrey,
                      ),
                      Positioned(
                        right: 12,
                        top: 15,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.wooDogTextColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Spacing.smallHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.nearYou,
                    style: textTheme.headline1,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.bottomCenter,
                    ),
                    onPressed: () {},
                    child: Text(
                      AppStrings.viewAll,
                      style: textTheme.bodyText2!.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Spacing.smallHeight(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200),
                child: Consumer(
                  builder: (_, watch, __) {
                    final dogWalkers = watch(dashboardProvider).getDogWalkers();

                    return ListView.builder(
                      itemCount: dogWalkers.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => DetailsCard(
                        dogWalker: dogWalkers[index],
                      ),
                    );
                  },
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.suggested,
                    style: textTheme.headline1,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.bottomCenter,
                    ),
                    onPressed: () {},
                    child: Text(
                      AppStrings.viewAll,
                      style: textTheme.bodyText2!.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Spacing.smallHeight(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200),
                child: Consumer(
                  builder: (_, watch, __) {
                    final dogWalkers = watch(dashboardProvider)
                        .getDogWalkers()
                        .reversed
                        .toList();

                    return ListView.builder(
                      reverse: false,
                      itemCount: dogWalkers.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => DetailsCard(
                        dogWalker: dogWalkers[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.dogWalker,
  });
  final DogWalkers dogWalker;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read(navigationService).showBottomSheet(
                  isScrolledControlled: true,
                  builderWidget: DogWalkerProfileView(
                    walker: dogWalker,
                  ),
                );
          },
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          image: AssetImage(dogWalker.imageString!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Spacing.tinyHeight(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dogWalker.name!,
                              textAlign: TextAlign.left,
                              style: textTheme.headline4!.copyWith(
                                color: AppColors.black,
                                fontSize: 17,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  IconlyLight.location,
                                  size: 13,
                                ),
                                Spacing.tinyWidth(),
                                Text(
                                  '${dogWalker.distance!}km from you',
                                  style: textTheme.bodyText2!.copyWith(
                                      fontSize: 11,
                                      color: AppColors.textNormalGrey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 25,
                          width: 48,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              '\$${dogWalker.chargeRate}/h',
                              style: textTheme.bodyText2!.copyWith(
                                fontSize: 10,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.blackShade,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          IconlyBold.star,
                          color: AppColors.starYellow,
                          size: 8,
                        ),
                        Spacing.tinyWidth(),
                        Text(
                          '${dogWalker.starRating}',
                          style: textTheme.bodyText2!.copyWith(
                              fontSize: 10, color: AppColors.starYellow),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Spacing.bigWidth()
      ],
    );
  }
}
