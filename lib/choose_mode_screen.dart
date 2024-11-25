import 'package:flutter/material.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/girl2.png', // Đảm bảo ảnh bạn đã tải lên đúng thư mục
              fit: BoxFit.cover, // Đảm bảo ảnh phủ đầy màn hình
            ),
          ),
          // Gradient Overlay để làm mờ ảnh nền và hiển thị nội dung rõ ràng
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5), 
                    Colors.grey[900]!.withOpacity(0.7),
                  ], 
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Các phần tử nội dung khác như logo, tiêu đề, biểu tượng chế độ và nút "Continue"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Spotify
                Image.asset(
                  'assets/spotify_logo.png', // Logo Spotify
                  height: 150,
                ),
                const SizedBox(height: 20),
                
                // Tiêu đề "Choose Mode"
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                
                // Biểu tượng chọn chế độ sáng/tối
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.nightlight_round, color: Colors.white, size: 40), // Dark Mode Icon
                    SizedBox(width: 20),
                    Icon(Icons.wb_sunny, color: Colors.white, size: 40), // Light Mode Icon
                  ],
                ),
                const SizedBox(height: 30),
                
                // Nút "Continue"
                ElevatedButton(
                  onPressed: () {
                    // Điều hướng khi người dùng chọn tiếp tục
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Màu nền của nút
                    minimumSize: const Size(double.infinity, 50), // Nút rộng đầy màn hình
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bo góc nút
                    ),
                  ),
                  child: const Text('Continue', style: TextStyle(color: Colors.black)), // Văn bản nút
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
