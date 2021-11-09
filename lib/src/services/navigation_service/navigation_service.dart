import 'package:acumen_task/src/services/navigation_service/i_navigation_service.dart';
import 'package:flutter/material.dart';

class NavigationService implements INavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<T?>? toNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  @override
  Future<T?>? pushReplace<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  @override
  void back<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop();
  }

  @override
  Future<dynamic> showBottomSheet<T>({
    required Widget builderWidget,
    Color? backgroundColor,
    bool? isScrolledControlled,
    ShapeBorder? shape,
    BoxConstraints? constraints,
  }) {
    final context = navigatorKey.currentContext!;
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: isScrolledControlled!,
      constraints: constraints,
      context: context,
      builder: (context) => builderWidget,
      backgroundColor: backgroundColor,
      shape: shape,
    );
  }
}
