import 'package:flutter/material.dart';
import 'package:flutter_api/screens/home_screen.dart';
import 'package:flutter_api/screens/register_screen.dart';
import 'package:flutter_api/screens/sign_in_screen.dart';
import 'loading_screen.dart';
import 'get_started_screen.dart';
import 'choose_mode_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/getStarted': (context) => const GetStartedScreen(),
        '/chooseMode': (context) => const ChooseModeScreen(),
        '/home': (context) => const HomeScreen(),
        '/signIn': (context) =>  SignInScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
