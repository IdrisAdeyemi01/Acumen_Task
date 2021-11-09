import 'package:acumen_task/src/features/authentication/views/signin_view.dart';
import 'package:acumen_task/src/features/authentication/views/signup_view.dart';
import 'package:acumen_task/src/features/chat/view/conversation_view.dart';
import 'package:acumen_task/src/features/home/views/home_view.dart';
import 'package:acumen_task/src/features/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const onboarding = '/onboarding';
  static const signup = '/signup';
  static const signin = '/signin';
  static const home = '/home';
  static const conversationView = '/conversationView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingView(),
        );
      case signup:
        return MaterialPageRoute(
          builder: (_) => SignupView(),
        );
      case signin:
        return MaterialPageRoute(
          builder: (_) => SigninView(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case conversationView:
        return MaterialPageRoute(
          builder: (_) => ConversationView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('The page ${settings.name} has not been defined'),
            ),
          ),
        );
    }
  }
}
