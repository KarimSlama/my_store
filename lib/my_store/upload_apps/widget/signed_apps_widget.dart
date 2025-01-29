import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';
import 'package:my_store/my_store/home/widget/download_button.dart';

class SignedAppsWidget extends StatelessWidget {
  const SignedAppsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            image: NetworkImage(
                'https://ahmad-up.com//public/uploads/apps/AC_Jodel/icon.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              SizedBox(
                width: 100.w,
                child: Text(
                    overflow: TextOverflow.ellipsis,
                    'title',
                    style: TextStyles.font18DarkBlueSemiBold),
              ),
              Text(AppString.editableApps, style: TextStyles.font13LightMedium),
            ],
          ),
          Spacer(),
          Column(
            spacing: 8.h,
            children: [
              Text('V23.2.1}', style: TextStyles.font12GrayMedium),
              DownloadButton(onBackPressed: () {}, btnText: AppString.download),
              Text('23MB', style: TextStyles.font12GrayMedium),
            ],
          ),
        ],
      ),
    );
  }
}
