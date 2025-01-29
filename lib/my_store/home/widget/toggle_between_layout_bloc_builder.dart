import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/controller/home_state.dart';
import 'package:my_store/my_store/home/widget/category_items_grid_view.dart';
import 'package:my_store/my_store/home/widget/category_items_list_view.dart';

class ToggleBetweenLayoutBlocBuilder extends StatelessWidget {
  const ToggleBetweenLayoutBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    bool isGrid = true;

    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
        current is Changed || current is Loaded,
        builder: (context, state) {
          if (state is Changed || state is Loaded) {
            context
                .read<HomeCubit>()
                .isGridView
                ? CategoryItemsGridView()
                : CategoryItemsListView();
          }
          return CategoryItemsGridView();
        },
      ),
    );
  }
}
