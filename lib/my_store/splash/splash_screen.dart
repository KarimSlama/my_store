import 'package:flutter/material.dart';
import 'package:my_store/core/helpers/extensions.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/widgets/gradinat_linear_scaffold_background.dart';
import 'package:my_store/my_store/splash/widget/text_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late Widget widget;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      child: TextSplash(),
    );
  } //end build()

  Future navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {
      context.pushNamed(Routes.signWithUDIDScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }
}
