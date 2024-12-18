import 'package:firebase_core/firebase_core.dart';
import 'package:flikka/core/theme/colors.dart';
import 'package:flikka/firebase_options.dart';
import 'package:flikka/on_borading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flilkka',
        theme: ThemeData(
          
          scaffoldBackgroundColor: MyColors.darkBlueColor,
          appBarTheme: AppBarTheme(color: MyColors.primary,centerTitle: true),
          brightness: Brightness.dark),
        home: OnBoradingScreen(),
      ),
    );
  }
}


