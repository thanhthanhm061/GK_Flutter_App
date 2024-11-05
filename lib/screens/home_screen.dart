import 'package:flutter/material.dart';
import 'package:flutter_api/screens/register_screen.dart';
import 'package:flutter_api/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Hình ảnh con gái ở góc dưới bên trái
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/background.png', // Đường dẫn đến hình ảnh
              width: 380, // Đặt kích thước phù hợp cho ảnh
              fit: BoxFit.cover,
            ),
          ),
          // Nội dung chính của màn hình
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/spotify_logo.png'), // Logo Spotify
                const SizedBox(height: 20),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Spotify is a proprietary Swedish audio \n streaming and media services provider',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white60),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nút Register bên trái
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1DB954), // Màu xanh lá của Spotify
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Register'),
                    ),
                    const SizedBox(width: 20), 

                    ElevatedButton(
                      onPressed: () {
                         print("Sign In button pressed");
                        Navigator.push(
                         
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, 
                        backgroundColor: Colors.white, 
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
