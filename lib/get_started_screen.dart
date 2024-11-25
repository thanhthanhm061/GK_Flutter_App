import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/girl1.png', // Hình nền cho màn hình này
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: TextStyle(color: Colors.grey[500]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/chooseMode');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
