import 'dart:ui';

import 'package:acumen_task/src/content/constants/colors.dart';
import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:acumen_task/src/features/chat/view/chat_view.dart';
import 'package:acumen_task/src/features/dashboard/view/dashboard_view.dart';
import 'package:acumen_task/src/features/home/views/moments_view.dart';
import 'package:acumen_task/src/features/home/views/profile_view.dart';
import 'package:acumen_task/src/shared/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';

final currentPageIndexProvider = StateProvider((ref) => 0);

class HomeView extends ConsumerWidget {
  final homeLabelsAndIcons = [
    {'label': AppStrings.home, 'iconData': IconlyBold.home},
    {'label': AppStrings.moments, 'iconData': IconlyBold.user_3},
    {'label': AppStrings.chat, 'iconData': IconlyBold.send},
    {'label': AppStrings.profile, 'iconData': IconlyBold.profile},
  ];

  final _pages = [
    DashboardView(),
    MomentsView(),
    ChatView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final textTheme = Theme.of(context).textTheme;
    final currentPageIndex = watch(currentPageIndexProvider);
    return StatusBar(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _pages[currentPageIndex.state],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.iconGrey,
          iconSize: 20,
          elevation: 0,
          backgroundColor: AppColors.white,
          currentIndex: currentPageIndex.state,
          onTap: (newIndex) => currentPageIndex.state = newIndex,
          items: homeLabelsAndIcons
              .map(
                (labelIcon) => BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      homeLabelsAndIcons.indexOf(labelIcon) != 2
                          ? Icon(
                              labelIcon['iconData'] as IconData,
                              // color: AppColors.iconGrey,
                            )
                          : currentPageIndex.state != 2
                              ? Stack(
                                  children: [
                                    Icon(
                                      labelIcon['iconData'] as IconData,
                                      // color: AppColors.iconGrey,
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 5,
                                        child: CircleAvatar(
                                          radius: 3,
                                          backgroundColor:
                                              AppColors.wooDogTextColor,
                                        ))
                                  ],
                                )
                              : Icon(
                                  labelIcon['iconData'] as IconData,
                                  // color: AppColors.iconGrey,
                                ),
                      Text(
                        labelIcon['label'] as String,
                        style: textTheme.bodyText2!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: homeLabelsAndIcons.indexOf(labelIcon) ==
                                  currentPageIndex.state
                              ? AppColors.black
                              : AppColors.iconGrey,
                        ),
                      )
                    ],
                  ),
                  label: '',
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
