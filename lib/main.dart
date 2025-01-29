import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/app_router.dart';
import 'package:my_store/core/service_locator/get_it.dart';
import 'package:my_store/my_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(
    MyStoreApp(appRouter: AppRouter()),
  );
}
