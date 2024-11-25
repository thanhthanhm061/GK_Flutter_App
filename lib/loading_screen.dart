import 'package:flutter/material.dart';
import 'dart:async';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/getStarted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/spotify_logo.png', // Logo Spotify
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
