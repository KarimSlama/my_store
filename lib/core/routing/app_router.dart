import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/service_locator/get_it.dart';
import 'package:my_store/my_store/dashboard/controller/dashboard_cubit.dart';
import 'package:my_store/my_store/dashboard/dashboard_screen.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/home_screen.dart';
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

      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DashboardCubit>(),
            child: DashboardScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return null;
    }
  }
}
