import 'package:flikka/core/theme/colors.dart';
import 'package:flikka/features/onboarding/widgets/build_page.dart';

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              buildpage(
                showButton: false,
                imagePath: "assets/images/onboarding1.png",
                title: "Confidence in your words",
                subtitle:
                    "With conversation-based learning, you'll be talking from lesson one",
              ),
              buildpage(
                showButton: false,
                imagePath: "assets/images/onboarding2.png",
                title: "Take your time to learn",
                subtitle:
                    "Develop a habit of learning and make it a part of your daily routine",
              ),
              buildpage(
                showButton: true,
                imagePath: "assets/images/onboarding3.png",
                title: "The lessons you need to learn",
                subtitle:
                    "Using a variety of learning styles to learn and retain",
              )
            ],
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.44,
              // right: 50,
              bottom: 315,
              child: SmoothPageIndicator(
                effect: WormEffect(
                  activeDotColor: MyColors.orangey,
                  dotWidth: 10,
                  dotHeight: 10
                ),
                controller: pageController, count: 3)
              
              ),
        ],
      ),
    );
  }
}

