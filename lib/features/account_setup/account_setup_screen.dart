// import 'package:flikka/auth/login_screen.dart';
// import 'package:flikka/auth/widgets/my_button.dart';
// import 'package:flikka/core/theme/colors.dart';
import 'package:flikka/features/account_setup/widgets/account_setup_page.dart';
import 'package:flikka/features/account_setup/widgets/congratulation.dart';
import 'package:flutter/material.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  PageController pageController = PageController();
  String? selectedLanguage;

  final List<Map<String, String>> languages = [

    {'name': 'English', 'code': 'en', 'flag': '🇬🇧'},
    {'name': 'French', 'code': 'fr', 'flag': '🇫🇷'},
    {'name': 'German', 'code': 'de', 'flag': '🇩🇪'},
    {'name': 'Chinese', 'code': 'zh', 'flag': '🇨🇳'},
    {'name': 'Korean', 'code': 'ko', 'flag': '🇰🇷'},
    {'name': 'Russian', 'code': 'ru', 'flag': '🇷🇺'},
    {'name': 'Japanese', 'code': 'ja', 'flag': '🇯🇵'},
    {'name': 'Arabic', 'code': 'ar', 'flag': '🇸🇦'},
    {'name': 'Spanish', 'code': 'es', 'flag': '🇪🇸'},
    {'name': 'Turkish', 'code': 'tr', 'flag': '🇹🇷'},
    {'name': 'Italian', 'code': 'it', 'flag': '🇮🇹'},
    {'name': 'Hindi', 'code': 'hi', 'flag': '🇮🇳'},
  ];
  final List<Map<String, String>> reasons = [

    {'name': 'Travel','image': 'assets/images/travel.png'},
    {'name': 'School', 'image': 'assets/images/school.png'},
    {'name': 'Work',  'image': 'assets/images/work.png'},
    {'name': 'Family/Friends',  'image': 'assets/images/family.png'},
    {'name': 'Skill Improvement',  'image': 'assets/images/skill.png'},
    {'name': 'Others',  'image': 'assets/images/others.png'},
    
  ];
  final List<Map<String, String>> level = [

    {'name': 'Not Much','image': 'assets/images/level.png'},
    {'name': 'Medium', 'image': 'assets/images/level.png'},
    {'name': 'Expert', 'image': 'assets/images/level.png'},
    
    
  ];
  final List<Map<String, String>> age = [

    {'name': 'Under 18',},
    {'name': '18-24',},
    {'name': '25-34',},
    {'name': '35-44',},
    {'name': '45-54',},
    {'name': '55-64',},
    {'name': '65 or older',},
    
    
    
  ];
  final List<Map<String, String>> time = [
     {'name': '5min/Day','image': 'assets/images/timer.png'},
    {'name': '15min/Day', 'image': 'assets/images/timer.png'},
    {'name': '30min/Day', 'image': 'assets/images/timer.png'},
    {'name': '60min/Day', 'image': 'assets/images/timer.png'},
    
  ];
  final List<Map<String, String>> hear = [

    {'name': 'Friend/Family',},
    {'name': 'Play Store',},
    {'name': 'Youtube',},
    {'name': 'TV',},
    {'name': 'Podcast',},
    {'name': 'Website Ad',},
    // {'name': '65 or older',},
    
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        AccountSetupPage(
          index: 1,
          txt: "what's ur mother language",
          image: false,
         pageController: pageController,
          list: languages),
        AccountSetupPage(
          index: 2,
          txt: "What is ur reason to learn this language",
          image: true,
          pageController: pageController,
          // pageController: PageController(),
          list: reasons),
        AccountSetupPage(
          index: 3,
          txt: "How much you know about this language?",
          image: true,
          pageController: pageController,
          // pageController: PageController(),
          list: level),
        AccountSetupPage(
          index: 4,
          txt: "How old are you?",
          image: false,
          pageController: pageController,
          // pageController: PageController(),
          list: age),
        AccountSetupPage(
          index: 5,
          txt: "How much time do you want to learn this language?",
          image: true,
          pageController: pageController,
          // pageController: PageController(),
          list: time),
        AccountSetupPage(
          index: 6,
          txt: "How did u hear about flikka?",
          image: false,
          pageController: pageController,
          // pageController: PageController(),
          list: hear),
          Congratulation()
          
      ],
    );
  }
}