import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voyage/src/app/presentation/widgets/AppChip.dart';
import 'package:voyage/src/app/presentation/widgets/app_card.dart';
import 'package:voyage/src/app/presentation/widgets/app_hollow_button.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/size_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/core/helper/assets_helper.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

@RoutePage()
class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final List<Map<String, dynamic>> _activityTabs = [
    {
      'leadingIcon': AssetsHelper.mockTestIcon,
      'title': 'Mock Test',
      'onTap': () {
        // Navigate to Home
      },
    },
    {
      'leadingIcon': AssetsHelper.bookmarkIcon,
      'title': 'Your Bookmarked Exercise',
      'onTap': () {
        // Navigate to Home
      },
    },
    {
      'leadingIcon': AssetsHelper.dictionaryIcon,
      'title': 'Your Personal Dictionary',
      'onTap': () {
        // Navigate to Home
      },
    },
    {
      'leadingIcon': AssetsHelper.historyIcon,
      'title': 'History',
      'onTap': () {
        // Navigate to Home
      },
    },
    {
      'leadingIcon': AssetsHelper.referralIcon,
      'title': 'Referrals',
      'onTap': () {
        // Navigate to Home
      },
    },
  ];
  final List<Map<String, dynamic>> _generalTabs = [
    {
      'leadingIcon': AssetsHelper.preferencesIcon,
      'title': 'Preferences',
      'onTap': () {
        // Navigate to Home
      },
    },
    {
      'leadingIcon': AssetsHelper.notificationIcon,
      'title': 'Notification',
      'onTap': () {
        // Navigate to Home
      },
    },
    {
      'leadingIcon': AssetsHelper.contactUsIcon,
      'title': 'Contact Us',
      'onTap': () {
        // Navigate to Home
      },
    },
    {
      'leadingIcon': AssetsHelper.rateUsIcon,
      'title': 'Rate Us',
      'onTap': () {
        // Navigate to Home
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: 20.padAll,
            child: Column(
              children: [
                AppCard(
                  padding: 0.padSymmetric(horizontal: 16, vertical: 8),
                  borderRadius: 16,
                  // height: double.infinity,
                  height: 327,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //replace with image
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColors.dark800,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 52,
                            color: AppColors.white,
                          ),
                        ),
                        16.height,

                        FittedBox(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 5.5,
                            ),
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryMain,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AssetsHelper.coinIcon),
                                const SizedBox(width: 2),
                                Text(
                                  '1200 Credits',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                        ),

                        4.height,
                        Text(
                          Supabase
                                  .instance
                                  .client
                                  .auth
                                  .currentUser
                                  ?.userMetadata!['username'] ??
                              'Guest',
                          style: AppStyles.text16PxSemiBold.white,
                        ),
                        4.height,
                        Text(
                          Supabase.instance.client.auth.currentUser?.email ??
                              'No Email',
                          style: AppStyles.text14PxSemiBold.dark400,
                        ),
                        12.height,
                        FittedBox(
                          child: AppHollowButton(
                            onPressed: () {},
                            title: "Profile Info",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.height,
                Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryMain,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    // style: ListTileStyle,
                    leading: Container(
                      padding: 7.padAll,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(AssetsHelper.crownIcon),
                    ),
                    title: Text(
                      'Buy Credits to level up your learning',
                      style: AppStyles.text14PxSemiBold.white,
                    ),

                    subtitle: Text(
                      'Enjoy all the benefits and explore more possibilities',
                      style: AppStyles.text10PxSemiBold.white,
                    ),

                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                ),

                20.height,
                AppCard(
                  padding: 0.padSymmetric(horizontal: 16, vertical: 8),
                  borderRadius: 16,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Activity", style: AppStyles.text16PxSemiBold.white),
                      8.height,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _activityTabs.length,
                        itemBuilder: (context, index) {
                          final activity = _activityTabs[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(activity['leadingIcon']),
                            title: Text(
                              activity['title'],
                              style: AppStyles.text14PxSemiBold.white,
                            ),
                            onTap: activity['onTap'],
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.dark700,
                              size: 16,
                            ),
                          );
                        },
                      ),

                      12.height,
                      Text("General", style: AppStyles.text16PxSemiBold.white),
                      8.height,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _generalTabs.length,
                        itemBuilder: (context, index) {
                          final activity = _generalTabs[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(activity['leadingIcon']),
                            title: Text(
                              activity['title'],
                              style: AppStyles.text14PxSemiBold.white,
                            ),
                            onTap: activity['onTap'],
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.dark700,
                              size: 16,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                28.height,

                // AppHollowButtonΩton(onPressed: (){}, title: "Logout", )
                Container(
                  // margin: 20.padVer,
                  // height: 46, // Set your desired height
                  decoration: BoxDecoration(
                    // gradient: AppColors.primaryMain,
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: AppColors.errorColor,
                    ), // Optional
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Logout",
                            style: AppStyles.text14PxSemiBold.error,
                          ),
                          10.width,
                          SvgPicture.asset(
                            AssetsHelper.logoutIcon,
                            color: AppColors.errorColor,
                            width: 16,
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
