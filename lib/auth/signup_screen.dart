// import 'package:flikka/auth/signup_screen.dart';
// import 'package:flikka/auth/sign_up_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikka/auth/login_screen.dart';
import 'package:flikka/auth/widgets/my_button.dart';
import 'package:flikka/auth/widgets/show_snakbar.dart';
import 'package:flikka/auth/widgets/text_with_text_form_field.dart';
import 'package:flikka/core/theme/colors.dart';
import 'package:flikka/features/account_setup/account_setup_screen.dart';
// import 'package:flikka/features/helper.dart';
// import 'package:flikka/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    GlobalKey<FormState> formkey = GlobalKey();
 String? email,name,password,repassword;
 
     TextEditingController emailController = TextEditingController();
     TextEditingController nameController = TextEditingController();
     TextEditingController passwordController = TextEditingController();
     TextEditingController passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              // SizedBox(
              //   width: 220,
              //   child: Image.asset("assets/images/Image & Text.png")),
                Text("Create an Account",style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
          
                ),textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                TextWithTextFormField(
                  controller: nameController,
                  // controller: passwordController,
                  label: "Name",
                  hint: "Enter your name",
                   onchanged: (value) {
                      name = value;
                    },
                ),
                // SizedBox(height: 10,),
                // TextWithTextFormField(
                //   // controller: passwordController,
                //   label: "Last Name",
                //   hint: "Enter your last name",
                // ),
                SizedBox(height: 10,),
                TextWithTextFormField(
                   onchanged: (value) {
                      email = value;
                    },
                  controller: emailController,
                  label: "Email Address",
                  hint: "Enter your email address",
                ),
                SizedBox(height: 15,),
                TextWithTextFormField(
                    onchanged: (value) {
                      password = value;
                    },
                  controller: passwordController,
                  label: "Password",
                  hint: "Enter your password",
                ),
                SizedBox(height: 15,),
                TextWithTextFormField(
                   onchanged: (value) {
                      repassword = value;
                    },
                  controller: passwordConfirmationController,
                  label: "Password Confirmation",
                  hint: "Re-Enter your password",
                ),
                SizedBox(height: 15,),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Text("Forget Password?",
                //   style: TextStyle(
                //     color: Color(0xFFF7C7E87)
                //   ),),
                // ),
                SizedBox(height: 15,),
                MyButton(word:"Sign Up",onPressed: () async{
                  // if (formkey.currentState!.validate()) {
                  //       // isLoading=true;
                  //       setState(() {
                          
                  //       });
                        try {
                          UserCredential credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );
                         // showSnakBar(context, "success");
                        Navigator.push( context, MaterialPageRoute(builder: (context) => AccountSetupScreen()), );

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnakBar(
                                context, "The password provided is too weak.");
                            // print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            showSnakBar(context,
                                "The account already exists for that email.");
                            // print('The account already exists for that email.');
                          }
                        } catch (e) {
                          showSnakBar(context, e.toString());
                        }
                        // isLoading = false;
                        setState(() {
                          
                        });
                      //  }
                // Navigator.push( context, MaterialPageRoute(builder: (context) => SignUpTwo()), );

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
                Text("Already you member? ",style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
                SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen()), );
                  
                },
                child: Text("Login",style: TextStyle(
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
    );
  }
}

