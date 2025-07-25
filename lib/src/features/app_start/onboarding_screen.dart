import 'package:auto_route/auto_route.dart';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:voyage/src/app/presentation/widgets/app_button.dart';
import 'package:voyage/src/app/presentation/widgets/gradient_dots_indicator.dart';
import 'package:voyage/src/core/extensions/padding_extension.dart';
import 'package:voyage/src/core/extensions/size_extension.dart';
import 'package:voyage/src/core/extensions/text_style_extension.dart';
import 'package:voyage/src/core/helper/assets_helper.dart';
import 'package:voyage/src/core/routes/app_router.dart';
import 'package:voyage/src/core/theme/app_colors.dart';
import 'package:voyage/src/core/theme/app_styles.dart';

@RoutePage()
class OnBoardingScreenPage extends StatefulWidget {
  const OnBoardingScreenPage({super.key});

  @override
  State<OnBoardingScreenPage> createState() => _OnBoardingScreenPageState();
}

class _OnBoardingScreenPageState extends State<OnBoardingScreenPage> {
  int currentIndex = 0;

  List<String> pageImages = [
    AssetsHelper.onBoardingOne,
    AssetsHelper.onBoardingTwo,
    AssetsHelper.onBoardingThree,
  ];

  List<Map<String, String>> pageContents = [
    {
      "title": "AI Powered Learning",
      "description":
          "Your IELTS journey, redefined. Personalized prep. Instant feedback. Band score, boosted.",
    },
    {
      "title": "Progress Tracking",
      "description":
          "With engaging and interactive learning, you can improve your language skills.",
    },
    {
      "title": "Practice Sets",
      "description":
          "Let's start now to upgrade your language skills higher",
    },
  ];

  final PageController _pageImageController = PageController();
  final PageController _pageContentController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: 20.padAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              140.height,
              // Expanded(child: Container()),
              SizedBox(
                height: 352, // Set your desired height
                child: PageView.builder(
                  controller: _pageImageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
        
                  itemBuilder: (context, index) {
                    return Center(
                      child: Image.asset(
                        pageImages[index],
                        // Replace with your image path
                        height: 352,
                        width: 352,
                        fit: BoxFit.cover, // Optional, controls scaling
                      ),
                    );
                  },
                ),
              ),
        
              15.height,
        
              GradientDotsIndicator(
                dotsCount: 3,
                currentIndex: currentIndex,
                activeGradient: AppColors.primaryMain,
                activeBorderRadius: BorderRadius.circular(5),
                activeDotSize: const Size(32, 6),
                dotSize: const Size(16, 6),
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInToLinear,
              ),
        
              20.height,
              SizedBox(
                height: 90,
                child: PageView.builder(
                  controller: _pageContentController,
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pageContents[index]['title'] ?? '',
                          style: AppStyles.text24PxSemiBold.white,
                        ),
                        8.height,
                        Text(
                          pageContents[index]['description'] ?? '',
                          style: AppStyles.text14PxRegular.white,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: 20.padAll,

        child: AppButton(
          title: "Next",
          onPressed: currentIndex < 2 ? () {
            setState(() {
              if (currentIndex < 2) {
                currentIndex++;
              } else {
                currentIndex = 0;
              }
            });

            _pageContentController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );

            _pageImageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }:(){
            context.router.replace(LoginRoute());
          },
        ),
      ),
    );
  }
}
