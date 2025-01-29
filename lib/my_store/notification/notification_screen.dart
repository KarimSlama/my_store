import 'package:flutter/material.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';
import 'package:my_store/core/widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            CustomAppBar(onBackPressed: () {}, isSearch: true),
            Flexible(
              child: Center(
                child: Text(
                  AppString.noNotificationYet,
                  style: TextStyles.font18DarkBlueBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
