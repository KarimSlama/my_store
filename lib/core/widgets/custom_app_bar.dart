import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool isSearch;
  final VoidCallback onBackPressed;

  const CustomAppBar(
      {super.key,
      required this.onBackPressed,
      this.title,
      required this.isSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14.w,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white.withValues(alpha: .2),
          radius: 25,
          backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/96607967?v=4'),
        ),
        Text(title ?? '', style: TextStyles.font16WhiteMedium),
        Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.white.withValues(alpha: .2),
          radius: 25,
          child: IconButton(
            onPressed: () {},
            icon: isSearch ? Icon(IconBroken.Search) : Icon(IconBroken.Plus),
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
