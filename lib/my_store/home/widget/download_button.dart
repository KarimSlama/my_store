import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';

class DownloadButton extends StatelessWidget {
  final VoidCallback onBackPressed;
  final String btnText;

  const DownloadButton({
    super.key,
    required this.onBackPressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onBackPressed();
      },
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(AppColors.white.withValues(alpha: .3)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.w,
        children: [
          Icon(
            Icons.apple,
            size: 30.sp,
            color: AppColors.white,
          ),
          Text(btnText, style: TextStyles.font16WhiteMedium),
        ],
      ),
    );
  }
}
