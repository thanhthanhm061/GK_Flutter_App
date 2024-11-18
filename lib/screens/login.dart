import 'package:flutter/material.dart';
import 'package:flutter_api/screens/home_page.dart';
import 'package:flutter_api/services/api_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Khai báo controller cho các TextField
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Hàm xử lý đăng nhập
  void _loginUser(BuildContext context, String email, String password) async {
    try {
      final apiService = ApiService();
      // Gọi API đăng nhập
      final response = await apiService.login(email, password);

      // Hiển thị thông báo đăng nhập thành công
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thành công!')),
      );

      // Điều hướng đến HomePage nếu đăng nhập thành công
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );

      // In thông tin trả về từ API (nếu cần)
      print('Thông tin người dùng: $response');
    } catch (e) {
      // Xử lý lỗi khi đăng nhập thất bại
      print('Lỗi đăng nhập: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thất bại: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/spotify_logo.png'), // Logo Spotify
            const SizedBox(height: 20),
            const Text(
              'Sign In',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'If You Need Any Support',
              style: TextStyle(color: Colors.grey),
            ),
            GestureDetector(
              onTap: () {}, // Add navigation to support page if needed
              child: const Text(
                'Click Here',
                style: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter Username Or Email',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Recovery Password',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  // Kiểm tra nếu người dùng để trống email hoặc mật khẩu
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng nhập email và mật khẩu')),
                  );
                  return;
                }

                // Gọi hàm đăng nhập
                _loginUser(context, email, password);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Sign In', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.android, color: Colors.white), // Icon cho Google
                SizedBox(width: 20),
                Icon(Icons.apple, color: Colors.white), // Icon cho Apple
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register'); // Chuyển hướng đến màn hình đăng ký
              },
              child: const Text(
                'Not A Member? Register Now',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
