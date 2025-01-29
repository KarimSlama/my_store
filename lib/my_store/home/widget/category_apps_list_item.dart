import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/controller/home_state.dart';
import 'package:my_store/my_store/home/widget/app_item_detail.dart';

class CategoryAppsListItem extends StatelessWidget {
  final int index;

  const CategoryAppsListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          homeLoading: () => CircularProgressIndicator(),
          homeLoaded: (data) {
            return AppItemDetail(appsCategoryData: data, index: index);
          },
          homeError: (errorHandler) => Text(errorHandler.apiErrorModel.data!),
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
