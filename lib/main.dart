import 'package:acumen_task/src/features/onboarding/view/onboarding_view.dart';
import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:acumen_task/src/services/snackbar_service/snackbar_service.dart';
import 'package:acumen_task/src/shared/routing/routes.dart';
import 'package:acumen_task/src/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acumen Task',
      debugShowCheckedModeBanner: false,
      navigatorKey: context.read(navigationService).navigatorKey,
      scaffoldMessengerKey: context.read(snackbarService).scaffoldMessengerKey,
      theme: AppTheme.themeData,
      onGenerateRoute: Routes.generateRoute,
      home: OnboardingView(),
    );
  }
}
