import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onBackPressed;
  final String btnText;
  final double width;

  const ButtonWidget(
      {super.key,
      required this.onBackPressed,
      required this.btnText,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onBackPressed();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.blue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll(Size(width, 55.h)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.w,
        children: [
          Text(btnText, style: TextStyles.font16WhiteMedium),
          Icon(
            Icons.apple,
            size: 30.sp,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
