import 'package:flikka/auth/login_screen.dart';
// import 'package:flikka/auth/widgets/my_button.dart';
import 'package:flikka/core/theme/colors.dart';
import 'package:flikka/features/choose_language_screen.dart';
import 'package:flutter/material.dart';

class buildpage extends StatelessWidget {
  final String imagePath;
  final bool showButton;
  final String title;
  final String subtitle;
  const buildpage({
    super.key,
    
    required this.imagePath,
    required this.showButton,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      color: MyColors.darkBlueColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:100,),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: 240,
              child: Image.asset(imagePath)),
          SizedBox(
            height: 80,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height:10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
        //  MyButton(
        //   onPressed: () {
            
        //   },
        //   word: "Choose Language",
        //  ),
        if(showButton)
        ElevatedButton(
              
              onPressed: () {
             Navigator.push( context, MaterialPageRoute(builder: (context) => ChooseLanguageScreen()), );

              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                  backgroundColor: MyColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "Choose Language",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              )),
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Already a user?",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
                SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen()), );
                  
                },
                child: Text("Login",style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),),
              )
              ],)
        ],
      ),
    );
  }
}

