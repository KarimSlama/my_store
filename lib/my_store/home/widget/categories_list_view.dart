import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/controller/home_state.dart';
import 'package:my_store/my_store/home/widget/category_options_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is CategoryLoading ||
            current is CategoryChanged ||
            current is CategoryLoaded,
        builder: (context, state) {
          return state.maybeWhen(
        categoryLoaded: (categories) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CategoryOptionsItem(
                    title: 'جميع التطبيقات',
                    isSelected: context.read<HomeCubit>().isSelected,
                    onTap: () {
                      context.read<HomeCubit>().setSelectedCategory('All');
                    },
                  ),
                );
              } else {
                final category =
                categories[index - 1];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CategoryOptionsItem(
                    title: category.title ?? '',
                    isSelected: context.read<HomeCubit>().selectedCategory ==
                        category.title,
                    onTap: () {
                      context
                          .read<HomeCubit>()
                          .setSelectedCategory(category.title ?? '');
                    },
                  ),
                );
              }
            },
          );
        },
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
