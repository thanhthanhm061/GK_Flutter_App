import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Ảnh bên trái
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/background.png', 
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
          ),
          // Nội dung chính
          Column(
            children: [
              // Logo và tiêu đề
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/spotify_logo.png', // Logo Spotify
                      height: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Enjoy Listening To Music',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Spotify is a proprietary Swedish audio streaming and media services provider.',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // Các nút Register và Sign In
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/register'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () => Navigator.pushNamed(context, '/signIn'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
