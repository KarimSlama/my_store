import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/widget/category_apps_grid_item.dart';

class CategoryItemsGridView extends StatelessWidget {
  const CategoryItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ScreenUtil().screenWidth > 400.w ? 3 : 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1 / 1.1,
      ),
      itemCount: context.read<HomeCubit>().apps.length,
      itemBuilder: (context, index) {
        return CategoryAppsGridItem(index: index);
      },
    );
  }
}
