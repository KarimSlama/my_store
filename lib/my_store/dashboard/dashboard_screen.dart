import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/my_store/dashboard/controller/dashboard_cubit.dart';
import 'package:my_store/my_store/dashboard/controller/dashboard_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.linear,
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CrystalNavigationBar(
              backgroundColor: AppColors.white.withValues(alpha: .3),
              selectedItemColor: Colors.lightBlueAccent,
              unselectedItemColor: AppColors.white,
              onTap: (value) {
                cubit.changeDashboardScreen(value);
              },
              indicatorColor: Colors.lightBlueAccent,
              currentIndex: cubit.currentIndex,
              items: [
                CrystalNavigationBarItem(icon: IconBroken.Home),
                CrystalNavigationBarItem(icon: IconBroken.Notification),
                CrystalNavigationBarItem(icon: IconBroken.Paper),
              ],
            ),
          ),
        );
      },
    );
  }
}
