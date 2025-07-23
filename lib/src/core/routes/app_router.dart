
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../app/presentation/splash_screen.dart';
import '../../features/app_start/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';

part 'app_router.gr.dart';
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)

class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenRoute.page, initial: true),
    AutoRoute(page: OnBoardingScreenRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
  ];

}