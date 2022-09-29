import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToReplacement(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndClearHistory(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (r) => false);
  }

  Future<dynamic> navigatePopAndPushNamed(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  navigatePopUntil(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  Future<dynamic> navigatePushAndRemoveUntil(
      String routeName, String routeToRemoveUntil,
      {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName,
        (Route<dynamic> route) => route.settings.name == routeToRemoveUntil,
        arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
