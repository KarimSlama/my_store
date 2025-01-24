import 'package:flutter/material.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/my_store/sign_with_udid/sign_with_udid_screen.dart';
import 'package:my_store/my_store/splash/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

      case Routes.signWithUDIDScreen:
        return MaterialPageRoute(
          builder: (context) => SignWithUdidScreen(),
        );

      default:
        return null;
    }
  }
}
