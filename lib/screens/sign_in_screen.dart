import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInScreen({super.key});

  Future<void> signIn(BuildContext context) async {
    // Gửi yêu cầu đăng nhập tới API
    try {
      final response = await http.post(
        Uri.parse('https://gk-flutter-app-api.onrender.com/api/signin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      // Xử lý phản hồi từ API
      if (response.statusCode == 200) {
        // Đăng nhập thành công
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
        Navigator.pushNamed(context, '/home'); // Chuyển đến màn hình chính
      } else {
        // Thông báo lỗi từ server
        final message = jsonDecode(response.body)['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message ?? 'Login failed')),
        );
      }
    } catch (error) {
      // Xử lý lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
      debugPrint('Error during login: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Spotify
            Image.asset(
              'assets/spotify_logo.png',
              height: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'If You Need Any Support Click Here',
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
            ),
            const SizedBox(height: 30),
            // Input fields
            _buildInputField(emailController, 'Enter  Email'),
            const SizedBox(height: 15),
            _buildInputField(passwordController, 'Password', obscureText: true),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {},
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Recovery Password',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Sign In Button
            ElevatedButton(
              onPressed: () {
                signIn(context); // Thực hiện đăng nhập khi nhấn nút
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Or Divider
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[800],
                    thickness: 1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[800],
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Social Media Icons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/google_logo.png'),
                  height: 30,
                ),
                SizedBox(width: 30),
                Image(
                  image: AssetImage('assets/apple_logo.png'),
                  height: 30,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/register'),
              child: const Text.rich(
                TextSpan(
                  text: 'Not A Member? ',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Register Now',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: obscureText
            ? const Icon(Icons.visibility_off, color: Colors.grey)
            : null,
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
