import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voyage/src/app/presentation/widgets/app_card.dart';
import 'package:voyage/src/app/presentation/widgets/app_gradient_text.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/size_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/core/helper/assets_helper.dart';
import 'package:voyage/src/core/theme/app_colors.dart';

import '../../../../../app/presentation/widgets/AppChip.dart';
import '../../../../../core/theme/app_styles.dart';

@RoutePage()
class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<Map<String, dynamic>> practiceModules = [
    {
      'title': 'Speaking Practice',
      'description': 'Part 1 , 2 & 3 multi-turn exercises.',
      'credit': 8,
      'icon': AssetsHelper.speakingPracticeIcon,
    },
    {
      'title': 'Reading Practice',
      'description': 'Part 1 , 2 & 3 multi-turn exercises.',
      'credit': 3,
      'icon': AssetsHelper.readingPracticeIcon,
    },
    {
      'title': 'Writing Practice',
      'description': 'Part 1 , 2 & 3 multi-turn exercises.',
      'credit': 3,
      'icon': AssetsHelper.writingPracticeIcon,
    },
    {
      'title': 'Listening Practice',
      'description': 'Part 1 , 2 & 3 multi-turn exercises.',
      'credit': 5,
      'icon': AssetsHelper.listeningPracticeIcon,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          'Choose our Practice Module',
          style: AppStyles.text18PxSemiBold.white,
        ),
        backgroundColor: AppColors.black,
      ),
      body: Padding(
        padding: 0.padSymmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: practiceModules.length,
                separatorBuilder: (context, index) => 20.height,
                itemBuilder: (context, index) {
                  final module = practiceModules[index];
                  return AppCard(
                    borderRadius: 16,
                    // margin: 10.padSymmetric(vertical: 8),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: 0.padOnly(
                                top: 21.5,
                                bottom: 21.5,
                                left: 16,
                              ),
                              child: Container(
                                padding: 14.padAll,
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryMain,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SvgPicture.asset(
                                  module['icon'],
                                  width: 42,
                                  height: 42,
                                ),
                              ),
                            ),
                            12.width,

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  module['title'],
                                  style: AppStyles.text16PxMedium.white,
                                ),
                                4.height,
                                Text(
                                  module['description'],
                                  style: AppStyles.text12PxSemiBold.dark400,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          right: 15,
                          top: 11,
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetsHelper.coinGradientIcon, height: 14, width: 14,),
                              2.width,
                              AppGradientText(
                                '${module['credit']} Credits',
                                style: AppStyles.text12PxSemiBold.white,
                                gradient: AppColors.orangeGradient,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
