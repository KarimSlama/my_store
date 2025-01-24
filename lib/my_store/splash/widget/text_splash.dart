import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';

class TextSplash extends StatelessWidget {
  const TextSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppString.myStore,
            style: TextStyles.font24BlueBold,
          ),
          Text(
            AppString.eachAppleAppsOnYourHand,
            style: TextStyles.font16WhiteMedium,
          ),
        ],
      ),
    );
  }
}
