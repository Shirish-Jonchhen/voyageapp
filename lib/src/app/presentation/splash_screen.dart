import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:voyage/src/core/helper/assets_helper.dart';
import 'package:voyage/src/core/theme/app_colors.dart';

import '../../core/routes/app_router.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    runStartupLogic();
    super.initState();
  }
  
  void runStartupLogic() {
    // Simulate a delay for splash screen
    Future.delayed(const Duration(seconds: 2), () {
      print("hello world");
      // Navigate to the next screen after the delay
      context.router.replace(const OnBoardingScreenRoute());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.primaryMain),
        child: Center(
          child: Image.asset(
            AssetsHelper.appIcon,
            height: 120,
            width: 120,
            fit: BoxFit.contain, // Optional, controls scaling
          ),
        ),
      ),
    );

  }
}
