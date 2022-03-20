import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Screens/Home/LandingPage.dart';
import 'package:recipe_app/Screens/startscreen/splashScreen.dart';

import 'Screens/auth/forgotPassword.dart';
import 'Screens/auth/loginPage.dart';
import 'Screens/auth/signUp.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/splash': (context) => const splashScreen(),
        '/loginPage': (context) => const LoginPage(),
        '/SignUp': (context) => const SignUp(),
        '/landingPage': (context) => const LandingPage(),
        '/resetPassword': (context) => const forgetPassword(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const splashScreen(),
    );
  }
}

