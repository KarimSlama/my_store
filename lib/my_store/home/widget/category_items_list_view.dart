import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/widget/category_apps_list_item.dart';

class CategoryItemsListView extends StatelessWidget {

  const CategoryItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<HomeCubit>().apps.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: GestureDetector(
            onTap: () {
              Constants.showCustomBottomSheet(
                  appsCategoryData!, index, context);
            },
            child: CategoryAppsListItem(index: index)),
      ),
    );
  }
}
