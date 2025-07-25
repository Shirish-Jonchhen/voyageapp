import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voyage/src/app/presentation/widgets/AppChip.dart';
import 'package:voyage/src/app/presentation/widgets/app_card.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/size_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';

import '../../../../app/presentation/widgets/app_button.dart';
import '../../../../app/presentation/widgets/app_hollow_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

@RoutePage()
class IeltsGoalsPage extends StatefulWidget {
  const IeltsGoalsPage({super.key});

  @override
  State<IeltsGoalsPage> createState() => _IeltsGoalsPageState();
}

class _IeltsGoalsPageState extends State<IeltsGoalsPage> {
  List<double> _targetIeltsScore = [6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0];
  List<String> _duration = [
    "1-2 months",
    "3-4 months",
    "5-6 months",
    "6+ months",
    "Not decided yet",
  ];
  List<String> _skillToImprove = [
    "Listening",
    "Reading",
    "Writing",
    "Speaking",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: 20.padAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: AppCard(
                      width: 40,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            context.router.pop();
                          },
                        ),
                      ),
                    ),
                  ),
                  18.width,
                  Expanded(
                    flex: 8,
                    child: LinearProgressIndicator(
                      backgroundColor: AppColors.dark800,
                      color: AppColors.white,
                      value: 0.66,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),

              67.height,

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "2",
                        style: AppStyles.text14PxSemiBold.white,
                        children: [
                          TextSpan(
                            text: " of 3",
                            style: AppStyles.text14PxRegular.dark700,
                          ),
                        ],
                      ),
                    ),
                    12.height,

                    Text(
                      "Your IELTS Goals",
                      style: AppStyles.text24PxSemiBold.white,
                      textAlign: TextAlign.center,
                    ),
                    12.height,
                    Text(
                      "Tell us about your target score  and timeline",
                      style: AppStyles.text16PxSemiBold.dark400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              40.height,
              Text(
                'Target IELTS Score',
                style: AppStyles.text16PxSemiBold.white,
              ),
              12.height,

              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: _targetIeltsScore.asMap().entries.map((entry) {
                    // final isSelected = _selectedScore == score;
                    final index = entry.key;
                    final score = entry.value;

                    return AppChip(
                      onTap: () => onSelectIeltsScore(index),
                      isActive: _selectedScoreIndex == index,
                      visible: true,
                      child: Text(
                        "$score",
                        style: AppStyles.text14PxSemiBold.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
              40.height,
              Text(
                'When do you plan to take the test?',
                style: AppStyles.text16PxSemiBold.white,
              ),
              12.height,
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  // alignment: WrapAlignment.spaceBetween,spaceBetween
                  direction: Axis.horizontal,
                  children: _duration.map((duration) {
                    final index = _duration.indexOf(duration);
                    return AppChip(
                      onTap: () => onSelectDuration(index),
                      isActive: _selectedDurationIndex == index,
                      visible: true,
                      child: Text(
                        duration,
                        style: AppStyles.text14PxSemiBold.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
              40.height,
              Text(
                'Which skill you think you need the most to improve?',
                style: AppStyles.text16PxSemiBold.white,
              ),
              12.height,
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  // alignment: WrapAlignment.spaceBetween,spaceBetween
                  direction: Axis.horizontal,
                  children: _skillToImprove.map((skill) {
                    final index = _skillToImprove.indexOf(skill);
                    return AppChip(
                      onTap: () => onSelectSkill(index),
                      isActive: _selectedSkillIndex == index,
                      visible: true,
                      child: Text(
                        skill,
                        style: AppStyles.text14PxSemiBold.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
              60.height,

              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppHollowButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      title: "Back",
                    ),
                  ),
                  18.width,
                  Expanded(
                    child: AppButton(
                      onPressed: () {
                        // context.router.push(IeltsGoalsRoute());
                      },
                      title: "Next",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _selectedScoreIndex = 0;

  void onSelectIeltsScore(int index) {
    setState(() {
      _selectedScoreIndex = index;
    });
  }

  int _selectedDurationIndex = 0;

  void onSelectDuration(int index) {
    setState(() {
      _selectedDurationIndex = index;
    });
  }

  int _selectedSkillIndex = 0;

  void onSelectSkill(int index) {
    setState(() {
      _selectedSkillIndex = index;
    });
  }
}
