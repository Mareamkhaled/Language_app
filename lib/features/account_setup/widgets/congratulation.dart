import 'package:flikka/auth/login_screen.dart';
import 'package:flikka/auth/widgets/my_button.dart';
import 'package:flikka/main.dart';
import 'package:flutter/material.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/cong.png",width: 420,),
          SizedBox(height: 30,),
          Text("Congratulation",style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700
          ),),
          SizedBox(height: 10,),
          Text("please! Login or Sign up &\n Get started",style: TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.w700
          ),textAlign: TextAlign.center,),

          SizedBox(height: 100,),
          MyButton(word: "Continue", onPressed: () {
          //  Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen()), );
            
          },)
        ],
        
            ),
      ),
    );
  }
}