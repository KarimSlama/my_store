import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/app_router.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/theme_dark.dart';

class MyStoreApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyStoreApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.appTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.dashboardScreen,
        onGenerateRoute: appRouter.generateRoute,
        theme: themeDark,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}
