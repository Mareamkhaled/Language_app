import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikka/auth/signup_screen.dart';
import 'package:flikka/auth/widgets/my_button.dart';
import 'package:flikka/auth/widgets/show_snakbar.dart';
import 'package:flikka/auth/widgets/text_with_text_form_field.dart';
import 'package:flikka/core/theme/colors.dart';
import 'package:flikka/features/account_setup/account_setup_screen.dart';
// import 'package:flikka/features/helper.dart';
// import 'package:flikka/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   GlobalKey <FormState> formkey = GlobalKey();
      String? email , password;
     TextEditingController emailController = TextEditingController();
     TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                SizedBox(
                  width: 220,
                  child: Image.asset("assets/images/Image & Text.png")),
                  Text("For free, join now and start \nlearning",style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
            
                  ),textAlign: TextAlign.center,),
                  SizedBox(height: 5,),
                  TextWithTextFormField(
                      onchanged: (data) {
                      email=data;
                    },
                    controller: emailController,
                    label: "Email Address",
                    hint: "Enter your email address",
                  ),
                  SizedBox(height: 15,),
                  TextWithTextFormField(
                    onchanged: (data) {
                      password=data;
                    },
                    controller: passwordController,
                    label: "Password",
                    hint: "Enter your password",
                  ),
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forget Password?",
                    style: TextStyle(
                      color: Color(0xFFF7C7E87)
                    ),),
                  ),
                  SizedBox(height: 15,),
                  MyButton(word:"Login",onPressed: () async{
                     if (formkey.currentState!.validate()) {
                      // isloading = true;
                      //  setState(() {
                          
                      //   });
                        try {
                          // ignore: unused_local_variable
                          UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                           email: email!,
                           password: password!
                              );         // showSnakBar(context, "success");
                                    Navigator.push( context, MaterialPageRoute(builder: (context) => AccountSetupScreen()), );

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnakBar(
                                
                                context, "No user found for that email. ");
                            // print('The password provided is too weak.');
                          } else if (e.code == 'wrong-password') {
                            showSnakBar(context,
                                "Wrong password provided for that user.");
                            // print('The account already exists for that email.');
                          }
                        } catch (e) {
                          showSnakBar(context, e.toString());
                        }
                      //  showSnakBar(context, "success");
                       }
                      else {
                       // showSnakBar(context, "NULL");
                      }
                  },),
                  SizedBox(height: 10,),
                  Text("Or",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16
                  ),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: MyColors.fadedBlueColor,
                        child: Image.asset("assets/images/facebook.png",width: 30,)),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: MyColors.fadedBlueColor,
                        child: Image.asset("assets/images/google.png",width: 30,)),
            
                      // Image.asset("assets/images/google.png",width: 30,)
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Not a Member? ",style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),),
                  SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute(builder: (context) => SignupScreen()), );
                    
                  },
                  child: Text("Signup",style: TextStyle(
                    color: Color(0xFFF5B7BFE),
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ),),
                )
                ],)
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}

