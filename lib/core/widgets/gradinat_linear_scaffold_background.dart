import 'package:flutter/material.dart';
import 'package:my_store/core/theming/app_colors/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;

  const GradientScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.linear,
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
