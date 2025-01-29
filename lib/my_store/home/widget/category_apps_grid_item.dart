import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/helpers/constants.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/controller/home_state.dart';
import 'package:my_store/my_store/home/widget/download_button.dart';

class CategoryAppsGridItem extends StatelessWidget {
  final int index;

  const CategoryAppsGridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return state.maybeWhen(
        homeLoading: () => CircularProgressIndicator(),
        homeLoaded: (data) {
          return GestureDetector(
            onTap: () {
              Constants.showCustomBottomSheet(data, index, context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.light.withValues(alpha: .2),
                  width: .5.w,
                ),
              ),
              child: Column(
                spacing: 10.h,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image(
                      width: 60.w,
                      height: 60.h,
                      image: NetworkImage(data[index].logo ?? ''),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          data[index].title ?? '',
                          style: TextStyles.font18DarkBlueSemiBold)),
                  Expanded(
                      flex: 1,
                      child: Text(AppString.editableApps,
                          style: TextStyles.font13LightMedium)),
                  DownloadButton(
                      onBackPressed: () {}, btnText: AppString.download),
                ],
              ),
            ),
          );
        },
        homeError: (errorHandler) => Text(errorHandler.apiErrorModel.data!),
        orElse: () => SizedBox.shrink(),
      );
    });
  }
}
