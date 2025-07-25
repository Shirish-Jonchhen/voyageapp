import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voyage/src/app/presentation/widgets/app_gradient_text.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/core/helper/assets_helper.dart';
import 'package:voyage/src/core/routes/app_router.dart';
import 'package:voyage/src/core/theme/app_colors.dart';

import '../../core/theme/app_styles.dart';

@RoutePage()
class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  List<PageRouteInfo> screens = [
    HomeRoute(),
    PracticeRoute(),
    RolePlayRoute(),
    MoreRoute(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': AssetsHelper.homeIcon, 'label': 'Home'},
      {'icon': AssetsHelper.practiceIcon, 'label': 'Practice'},
      {'icon': AssetsHelper.rolePlayIcon, 'label': 'Role Play'},
      {'icon': AssetsHelper.moreIcon, 'label': 'More'},
    ];

    return AutoTabsRouter(
      routes: screens,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context); // ✅ Safe here
        final index = tabsRouter.activeIndex;

        return Scaffold(
          backgroundColor: AppColors.black,
          body: child,
          bottomNavigationBar: Theme(
            data: ThemeData(splashColor: AppColors.black),
            child: Container(
              color: AppColors.black,
              padding: EdgeInsets.only(bottom: 20),
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(items.length, (i) {
                  final isSelected = i == index;
                  final gradient = AppColors.primaryMain;

                  return GestureDetector(
                    onTap: () => tabsRouter.setActiveIndex(i),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          items[i]['icon']!,
                          width: 24,
                          color: isSelected ? null : AppColors.white200,
                        ),
                        const SizedBox(height: 4),
                        isSelected
                            ? AppGradientText(
                          items[i]['label']!,
                          style: AppStyles.text10PxSemiBold,
                          gradient: gradient,
                        )
                            : Text(
                          items[i]['label']!,
                          style: AppStyles.text10PxSemiBold.copyWith(
                            color: AppColors.white200,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }


  BottomNavigationBarItem _buildNavItem(
    String asset,
    String label,
    bool isSelected,
  ) {
    final gradient = LinearGradient(
      colors: [Color(0xFF00B2FF), Color(0xFF4670DA)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // Default (unselected) icon
    final defaultIcon = SvgPicture.asset(
      asset,
      width: 24,
      color: AppColors.white200,
    );

    // Gradient icon for selected state
    final gradientIcon = ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: SvgPicture.asset(
        asset,
        width: 24,
        color: Colors.white, // color overridden by ShaderMask
      ),
    );

    return BottomNavigationBarItem(
      icon: defaultIcon,
      activeIcon: gradientIcon,
      label: label,
    );
  }
}
