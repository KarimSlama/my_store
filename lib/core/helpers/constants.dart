import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:my_store/core/helpers/extensions.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';
import 'package:my_store/my_store/home/data/model/all_apps_model.dart';
import 'package:my_store/my_store/home/widget/app_item_detail.dart';

class Constants{
  static void showCustomBottomSheet(
      List<AppsCategoryData> data, index, BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 1.0,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: AppColors.black.withValues(alpha: 1),
                padding: EdgeInsets.all(14),
                // height: 500.h,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16.h,
                    children: [
                      Row(
                        spacing: 90.w,
                        children: [
                          IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(IconBroken.Close_Square)),
                          Text(data[index].title ?? '',
                              style: TextStyles.font20DarkBlueBold),
                        ],
                      ),
                      AppItemDetail(appsCategoryData: data, index: index),
                      Text(AppString.description,
                          style: TextStyles.font18DarkBlueBold),
                      Text(data[index].description ?? '',
                          style: TextStyles.font13LightRegular),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}