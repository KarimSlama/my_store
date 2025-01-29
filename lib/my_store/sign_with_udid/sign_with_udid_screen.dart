import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/helpers/extensions.dart';
import 'package:my_store/core/helpers/spacing.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/app_strings/app_string.dart';
import 'package:my_store/core/theming/app_themes/text_styles.dart';
import 'package:my_store/core/widgets/button_widget.dart';
import 'package:my_store/core/widgets/gradinat_linear_scaffold_background.dart';

class SignWithUdidScreen extends StatelessWidget {
  const SignWithUdidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.eachAppleAppsOnYourHand,
              style: TextStyles.font24BlueBold,
            ),
            Text(
              AppString.appleStoreIsAStoreThatGiveYou,
              style: TextStyles.font14DarkBlueMedium,
            ),
            verticalSpace(20),
            ButtonWidget(
              onBackPressed: () {
                context.pushNamed(Routes.dashboardScreen);
              },
              btnText: AppString.continueWithUDID,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
