import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/controller/home_state.dart';

class ToggleIconButton extends StatelessWidget {
  const ToggleIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is Changed,
      builder: (context, state) {
        final isGrid = context.read<HomeCubit>().isGridView;
        return CircleAvatar(
          backgroundColor: AppColors.white.withValues(alpha: .3),
          radius: 20,
          child: IconButton(
            onPressed: () {
              context.read<HomeCubit>().toggleLayout();
              print('pressed the isGrid is ${isGrid}');
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isGrid
                  ? Icon(
                Icons.menu,
                key: ValueKey('menuIcon'),
                color: AppColors.white,
              )
                  : Icon(
                IconBroken.Category,
                key: ValueKey('categoryIcon'),
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
