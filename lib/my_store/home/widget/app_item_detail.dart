import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';
import 'package:my_store/my_store/home/data/model/all_apps_model.dart';
import 'package:my_store/my_store/home/widget/download_button.dart';

class AppItemDetail extends StatelessWidget {
  final List<AppsCategoryData> appsCategoryData;
  final int index;

  const AppItemDetail(
      {super.key, required this.appsCategoryData, required this.index});

  @override
  Widget build(BuildContext context) {
    int size = appsCategoryData[index].size!;
    String sizeString = size.toString();
    String firstTwoDigits = sizeString.substring(0, 2);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.light.withValues(alpha: .2),
          width: .5.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 14.w,
        children: [
          Image(
            width: 75.w,
            height: 75.h,
            image: NetworkImage(appsCategoryData[index].logo ?? ''),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    appsCategoryData[index].title ?? '',
                    style: TextStyles.font18DarkBlueSemiBold),
              ),
              Text(AppString.editableApps,
                  style: TextStyles.font13LightMedium),
            ],
          ),
          Spacer(),
          Column(
            spacing: 8.h,
            children: [
              Text('V${appsCategoryData[index].currentVersion}',
                  style: TextStyles.font12GrayMedium),
              DownloadButton(
                  onBackPressed: () {}, btnText: AppString.download),
              Text('$firstTwoDigits MB', style: TextStyles.font12GrayMedium),
            ],
          ),
        ],
      ),
    );
  }
}
