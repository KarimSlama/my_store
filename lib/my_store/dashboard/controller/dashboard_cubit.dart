import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/service_locator/get_it.dart';
import 'package:my_store/my_store/dashboard/controller/dashboard_state.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/home_screen.dart';
import 'package:my_store/my_store/notification/notification_screen.dart';
import 'package:my_store/my_store/upload_apps/upload_apps_screen.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  int currentIndex = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getCategories()
        ..getAllApps(),
      child: HomeScreen(),
    ),
    NotificationScreen(),
    UploadAppsScreen()
  ];

  void changeDashboardScreen(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(DashboardState.changed(currentIndex));
    }
  }
}
