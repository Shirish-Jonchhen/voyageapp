import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voyage/src/app/presentation/widgets/app_button.dart';
import 'package:voyage/src/app/presentation/widgets/app_hollow_button.dart';
import 'package:voyage/src/app/presentation/widgets/app_text_field.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/size_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/core/routes/app_router.dart';
import 'package:voyage/src/core/theme/app_styles.dart';

import '../../../../app/presentation/widgets/AppChip.dart';
import '../../../../app/presentation/widgets/app_card.dart';
import '../../../../core/theme/app_colors.dart';

@RoutePage()
class PreferencesSetupPage extends StatefulWidget {
  const PreferencesSetupPage({super.key});

  @override
  State<PreferencesSetupPage> createState() => _PreferencesSetupPageState();
}

class _PreferencesSetupPageState extends State<PreferencesSetupPage> {
  //pageview controller
  final PageController _pageController = PageController();
  int currentPage = 1;
  bool isAnimating = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _phoneFocusNode.addListener(() {
      setState(() {
        _isPhoneFocused = _phoneFocusNode.hasFocus;
      });
    });

    _referralFocusNode.addListener(() {
      setState(() {
        _isReferralFocused = _referralFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneFocusNode.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _referralFocusNode.dispose();
    _referralController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: 20.padVer,
          child: Column(
            children: [
              Padding(
                padding: 20.padHor,
                child: Row(
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
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: 0,
                          end:
                              currentPage /
                              5, // Assuming 3 total pages (0, 1, 2)
                        ),
                        duration: Duration(milliseconds: 300),
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            value: value,
                            backgroundColor: AppColors.dark800,
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(100),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              67.height,

              // if(currentPage < 4)
              RichText(
                text: TextSpan(
                  text: "$currentPage",
                  style: AppStyles.text14PxSemiBold.white,
                  children: [
                    TextSpan(
                      text: " of 5",
                      style: AppStyles.text14PxRegular.dark700,
                    ),
                  ],
                ),
              ),

              12.height,

              Expanded(
                child: PageView(
                  // scrollDirection: Ne,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    _personalDetailPage(),
                    _ieltsGoalsPage(),
                    _studyPrefs(),
                    _referrals(),
                    _lastPage(),
                  ],
                ),
              ),
              // 60.height,
              Padding(
                padding: 20.padHor,
                child: Row(
                  children: [
                    Expanded(
                      child: AppHollowButton(
                        onPressed: currentPage == 1 || isAnimating
                            ? null
                            : () async {
                                setState(() => isAnimating = true);
                                await _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                setState(() {
                                  currentPage--;
                                  isAnimating = false;
                                });
                              },
                        title: "Back",
                      ),
                    ),
                    18.width,
                    Expanded(
                      child: AppButton(
                        onPressed: isAnimating
                            ? null
                            : () async {
                                if (currentPage < 5) {
                                  setState(() => isAnimating = true);
                                  await _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  setState(() {
                                    currentPage++;
                                    isAnimating = false;
                                  });
                                } else {
                                  // Final action
                                  context.router.push(const BottomNavbarRoute());
                                }
                              },
                        title:
                            currentPage == 4 &&
                                (_referralController.text.isEmpty ||
                                    _referralController.text == null)
                            ? "Skip"
                            : currentPage < 5
                            ? "Next"
                            : "Continue",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //page 1
  //Date of birth
  final TextEditingController _dobController = TextEditingController();
  DateTime initialDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != initialDate) {
      setState(() {
        initialDate = date;
        _dobController.text = "${date.day}/${date.month}/${date.year}";
      });
    }
  }

  //Gender
  final TextEditingController _genderController = TextEditingController();

  Future<void> _selectGender(BuildContext context) async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Gender'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Male'),
                onTap: () => Navigator.pop(context, 'Male'),
              ),
              ListTile(
                title: Text('Female'),
                onTap: () => Navigator.pop(context, 'Female'),
              ),
            ],
          ),
        );
      },
    );
    if (selected != null) {
      setState(() {
        _genderController.text = selected;
      });
    }
  }

  //phone number
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  bool _isPhoneFocused = false;

  //eng level
  final List<String> _genders = ['Male', 'Female'];
  String? _selectedGender;
  final TextEditingController _engLevelController = TextEditingController();

  Widget _personalDetailPage() {
    return Padding(
      padding: 20.padHor,
      child: Column(
        children: [
          Text(
            "Welcome to your IELTS \n Journey?",
            style: AppStyles.text24PxSemiBold.white,
            textAlign: TextAlign.center,
          ),
          12.height,
          Text(
            "Please give some true answers for \n following question",
            style: AppStyles.text16PxSemiBold.dark400,
            textAlign: TextAlign.center,
          ),
          40.height,
          AppTextField(
            onTap: () => _selectDate(context),
            focusNode: null,
            isFocused: false,
            hintText: "Date of Birth",
            enabled: false,
            controller: _dobController,
            borderRadius: 12,
            iconData: Icons.calendar_month,
          ),
          16.height,
          AppTextField(
            onTap: () => _selectGender(context),
            focusNode: null,
            isFocused: false,
            enabled: false,
            hintText: "Gender",
            controller: _genderController,
            iconData: Icons.person,
          ),
          16.height,
          AppTextField(
            focusNode: _phoneFocusNode,
            isFocused: _isPhoneFocused,
            hintText: "Phone Number",
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            iconData: Icons.phone,
          ),
          16.height,
          AppTextField(
            focusNode: null,
            isFocused: false,
            hintText: "Current English Level",
            controller: _engLevelController,
            iconData: Icons.language,
            suffixIconData: Icons.keyboard_arrow_down,
            onTap: () {
              //doalog to sheo eng sepaking level
            },
          ),
        ],
      ),
    );
  }

  //PAGE 2
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

  final List<double> _targetIeltsScore = [6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0];
  final List<String> _duration = [
    "1-2 months",
    "3-4 months",
    "5-6 months",
    "6+ months",
    "Not decided yet",
  ];
  final List<String> _skillToImprove = [
    "Listening",
    "Reading",
    "Writing",
    "Speaking",
  ];

  Widget _ieltsGoalsPage() {
    return Padding(
      padding: 20.padHor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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

          40.height,
          Text('Target IELTS Score', style: AppStyles.text16PxSemiBold.white),
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
                  child: Text(skill, style: AppStyles.text14PxSemiBold.white),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  //Page 3
  List<String> _studyTimeOptions = [
    "10 minutes",
    "20 minutes",
    "30 minutes",
    "1 hour",
    "2 hours",
  ];

  int _selectedStudyTimeIndex = 0;

  void onSelectStudyTime(int index) {
    setState(() {
      _selectedStudyTimeIndex = index;
    });
  }

  List<String> _mainGoals = [
    "University Application",
    "Immigration",
    "Job Requirements",
    "Personal Development",
    "Other",
  ];
  int _selectedMainGoalIndex = 0;

  void onSelectMainGoal(int index) {
    setState(() {
      _selectedMainGoalIndex = index;
    });
  }

  Widget _studyPrefs() {
    return Padding(
      padding: 20.padHor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Study Preferences",
                  style: AppStyles.text24PxSemiBold.white,
                  textAlign: TextAlign.center,
                ),
                12.height,
                Text(
                  "Help us customize your learning experience.",
                  style: AppStyles.text16PxSemiBold.dark400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          40.height,
          Text(
            'How much time can you dedicate daily?',
            style: AppStyles.text16PxSemiBold.white,
          ),
          12.height,

          SizedBox(
            // width: double.infinity,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              // alignment: WrapAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: _studyTimeOptions.asMap().entries.map((entry) {
                // final isSelected = _selectedScore == score;
                final index = entry.key;
                final score = entry.value;

                return AppChip(
                  onTap: () => onSelectStudyTime(index),
                  isActive: _selectedStudyTimeIndex == index,
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
            'What are your main goals?',
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
              children: _mainGoals.map((duration) {
                final index = _mainGoals.indexOf(duration);
                return AppChip(
                  onTap: () => onSelectMainGoal(index),
                  isActive: _selectedMainGoalIndex == index,
                  visible: true,
                  child: Text(
                    duration,
                    style: AppStyles.text14PxSemiBold.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  //Page 4
  final TextEditingController _referralController = TextEditingController();
  final FocusNode _referralFocusNode = FocusNode();
  bool _isReferralFocused = false;

  Widget _referrals() {
    return Padding(
      padding: 20.padHor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Enter Referral Code",
                  style: AppStyles.text24PxSemiBold.white,
                  textAlign: TextAlign.center,
                ),
                12.height,
                Text(
                  "Get bonus credits on being referred",
                  style: AppStyles.text16PxSemiBold.dark400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          40.height,
          AppTextField(
            hintText: "Referral Code",
            controller: _referralController,
            iconData: Icons.polyline_sharp,
            borderRadius: 12,
            focusNode: _referralFocusNode,
            isFocused: _isReferralFocused,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _lastPage() {
    return Padding(
      padding: 20.padHor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "You're All Set!",
                  style: AppStyles.text24PxSemiBold.white,
                  textAlign: TextAlign.center,
                ),
                12.height,
                Text(
                  "Your personalized IELTS preparation plan is ready",
                  style: AppStyles.text16PxSemiBold.dark400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          40.height,
          Container(
            height: 104,
            width: 104,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.greenGradient,
            ),
            child: Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success700,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: AppColors.white,
                  size: 70,
                ),
              ),
            ),
          ),
          24.height,
          Text(
            "Your Personalized Plan",
            style: AppStyles.text20PxBold.white,
            textAlign: TextAlign.center,
          ),
          8.height,
          SizedBox(
            width: 213,
            child: Text(
              "Based on your responses, we’ve created a customized study plan to help you achieve your target score of your goal.",
              style: AppStyles.text12PxMedium.neutral200,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
