import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://gk-flutter-app-api.onrender.com/api";

  // API Đăng ký
  Future<Map<String, dynamic>> register(String email, String password) async {
    final url = Uri.parse('$baseUrl/signup');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body); // Trả về kết quả đăng ký
    } else {
      throw Exception('Đăng ký thất bại: ${response.body}');
    }
  }

  // API Đăng nhập
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/signin');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Giải mã JSON trả về từ API
      final data = jsonDecode(response.body);

      // Xử lý dữ liệu trả về và chuyển đổi thành Map
      return {
        "id": data["_id"]["\$oid"], // Lấy id từ object JSON
        "username": data["username"],
        "email": data["email"],
        "age": data["age"],
        "createdAt": data["createdAt"]["\$date"], // Lấy ngày tạo
      };
    } else {
      throw Exception('Đăng nhập thất bại: ${response.body}');
    }
  }

  // Placeholder cho các API khác (nếu cần)
  fetchTracks() {}
}
