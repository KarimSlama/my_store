import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';
import 'package:my_store/core/widgets/custom_app_bar.dart';
import 'package:my_store/my_store/upload_apps/widget/signed_apps_widget.dart';

class UploadAppsScreen extends StatefulWidget {
  const UploadAppsScreen({super.key});

  @override
  State<UploadAppsScreen> createState() => _UploadAppsScreenState();
}

class _UploadAppsScreenState extends State<UploadAppsScreen> {
  int _selectedValue = 1;

  Widget _buildScreenContent(int value) {
    switch (value) {
      case 1:
        return Center(
            child: Text("لا يوجد تنزيلات حتي الآن",
                style: TextStyles.font16WhiteMedium));
      case 2:
        return SignedAppsWidget();
      default:
        return Center(child: Text("Invalid Selection"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(onBackPressed: () {}, isSearch: false),
              Center(
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: _selectedValue,
                  children: {
                    1: Row(
                      children: [
                        Icon(IconBroken.Download),
                        SizedBox(width: 10.w),
                        Text(AppString.downloaded,
                            style: TextStyles.font14WhiteMedium),
                      ],
                    ),
                    2: Row(
                      children: [
                        Icon(IconBroken.Edit_Square),
                        SizedBox(width: 10.w),
                        Text(AppString.signedApps,
                            style: TextStyles.font14WhiteMedium),
                      ],
                    ),
                  },
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withValues(alpha: .2),
                        blurRadius: .2,
                        spreadRadius: .2,
                        offset: Offset(
                          .2,
                          .2,
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
              ),
              _buildScreenContent(_selectedValue),
            ],
          ),
        ),
      ),
    );
  }
}
