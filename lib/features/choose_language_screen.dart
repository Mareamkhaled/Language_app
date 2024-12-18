import 'package:flikka/auth/login_screen.dart';
import 'package:flikka/auth/widgets/my_button.dart';
import 'package:flikka/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String? selectedLanguage;
  final List<Map<String, String>> languages = [
    // {'name': 'English', 'code':'en','flag': 'GB'},
    // {'name': 'French', 'code':'fr','flag': 'FR'},
    // {'name': 'German','code':'de', 'flag': 'DE'},
    // {'name': 'Chinese', 'code':'zh','flag': 'CN'},
    // {'name': 'Korean','code':'ko', 'flag': 'KR'},
    // {'name': 'Russian', 'code':'ru','flag': 'RU'},
    // {'name': 'Japanese','code':'ja', 'flag': 'JP'},
    // {'name': 'Arabic','code':'ar', 'flag': 'SA'},
    // {'name': 'Spanish','code':'es', 'flag': 'ES'},
    // {'name': 'Turkish', 'code':'tr', 'flag': 'TR'},
    // {'name': 'Italian', 'code':'it', 'flag': 'IT'},
    // {'name': 'Hindi', 'code':'hi', 'flag': 'IN'},
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/earth.png",
                width: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose a Language to Learn",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (_, index) {
                  final language = languages[index];
                  final isSelected = selectedLanguage == language['code'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage=language['code'];
                      });
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            style: TextStyle(fontSize: 24),
                            language['flag']!,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            language['name']!,
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: isSelected
                              ? MyColors.primary
                              : MyColors.fadedBlueColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
              )),
              selectedLanguage !=null?
              MyButton(word: "Continue", onPressed: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen()), );

              },)
            //  Row(
            //    children: [
            //      Expanded(
            //        child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: MyColors.primary,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12)
            //           ),
            //           padding: EdgeInsets.symmetric(vertical: 20)
            //         ),
            //         onPressed: () {
                     
            //        }, child: Text("Continue")),
            //      ),
            //    ],
            //  ):
             :Container()
            ],
          ),
        ),
      ),
    );
  }
}
