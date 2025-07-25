import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../app/presentation/bottom_navbar_screen.dart';
import '../../app/presentation/splash_screen.dart';
import '../../features/app_start/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home_pages/home/presentation/screens/home_screen.dart';
import '../../features/home_pages/more/presentation/screens/more_screen.dart';
import '../../features/home_pages/practice/presentation/screens/practice_screen.dart';
import '../../features/home_pages/role_play/presentation/screens/role_play_screen.dart';
import '../../features/personalization/presentation/screens/ielts_goals_screen.dart';
import '../../features/personalization/presentation/screens/preferences_set_up_screen.dart';
import '../../features/personalization/presentation/screens/preferences_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
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
    AutoRoute(page: IeltsGoalsRoute.page),
    AutoRoute(page: PreferencesSetupRoute.page),
    AutoRoute(page: StudyPreferencesRoute.page),
    AutoRoute(page: BottomNavbarRoute.page, children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: PracticeRoute.page),
      AutoRoute(page: RolePlayRoute.page),
      AutoRoute(page: MoreRoute.page),
    ]),
  ];
}
