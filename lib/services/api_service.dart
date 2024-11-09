import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api/screens/MusicHomeScreen.dart';
import 'package:http/http.dart' as http;

// Hàm đăng ký
Future<bool> register(String fullName, String password, String email) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/api/users/register'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'full_name':fullName,
      'password': password,
      'email': email,
    }),
  );

  return response.statusCode == 200;
}

// Hàm đăng nhập
Future<bool> login(String fullName, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/api/users/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'full_name': fullName,
      'password': password,
    }),
  );

  return response.statusCode == 200;
}

// Widget nút đăng ký
class RegisterButton extends StatelessWidget {
  final String fullname;
  final String password;
  final String email;

  const RegisterButton({super.key, 
    required this.fullname,
    required this.password,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool success = await register(fullname, password, email);
        if (success) {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (context) => const MusicHomeScreen()),
          );
        } else {
          // Hiển thị thông báo lỗi
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng ký thất bại. Vui lòng thử lại.')),
          );
        }
      },
      child: const Text('Register'),
    );
  }
}
