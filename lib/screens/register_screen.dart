import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    // Kiểm tra nếu mật khẩu và xác nhận mật khẩu khớp
    if (passwordController.text != confirmPasswordController.text) {
      print('Mật khẩu không khớp.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match!')),
      );
      return;
    }

    // In thông tin kiểm tra trước khi gửi request
    print('Sending registration request...');
    print('Username: ${usernameController.text}');
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');

    // Gửi yêu cầu đăng ký tới API
    try {
      final response = await http.post(
        Uri.parse('https://gk-flutter-app-api.onrender.com/api/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text,
        }),
      );

      // In trạng thái và nội dung phản hồi từ server
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Kiểm tra trạng thái phản hồi
      if (response.statusCode == 201) {
        print('Đăng ký thành công.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful!')),
        );
        Navigator.pushNamed(context, '/signIn');
      } else {
        // Nếu có lỗi, hiển thị thông báo lỗi
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'] ?? 'Registration failed';
        print('Error message: $message');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } catch (e) {
      print('Error during registration: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Please try again.')),
      );
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
          onPressed: () {
            print('Back button pressed.');
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text(
                'Create your account to get started!',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildInputField(usernameController, 'username'),
            const SizedBox(height: 15),
            _buildInputField(emailController, 'Enter Email'),
            const SizedBox(height: 15),
            _buildInputField(passwordController, 'Password', obscureText: true),
            const SizedBox(height: 15),
            _buildInputField(confirmPasswordController, 'Confirm Password', obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Register button pressed.');
                register();
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
                  'Register',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Or',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),
            _buildSocialLoginButtons(),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  print('Navigate to Sign In screen.');
                  Navigator.pushNamed(context, '/signIn');
                },
                child: const Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
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
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print('Google login tapped.');
            // TODO: Thêm logic đăng nhập Google
          },
          child: Image.asset(
            'assets/google_logo.png', // Đường dẫn tới logo Google
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            print('Apple login tapped.');
            // TODO: Thêm logic đăng nhập Apple
          },
          child: Image.asset(
            'assets/apple_logo.png', // Đường dẫn tới logo Apple
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
