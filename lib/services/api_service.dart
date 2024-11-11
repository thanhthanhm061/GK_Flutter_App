import 'dart:convert';
import 'package:flutter_api/services/modeltrack.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String apiUrl = 'https://gk-flutter-app-api.onrender.com/api/products'; 

  Future<List<Track>> fetchTracks() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    List<Track> tracks = [];

    // Kiểm tra nếu jsonData không trống và có chứa playlist
    if (jsonData.isNotEmpty && jsonData[0]['playlists'] != null) {
      // Truy cập vào playlist đầu tiên và lấy danh sách tracks
      var playlist = jsonData[0]['playlists'][0];
      var trackList = playlist['tracks'] as List<dynamic>;

      // Chuyển đổi trackList thành đối tượng Track
      tracks = trackList.map((trackJson) => Track.fromJson(trackJson)).toList();
    } else {
      print('No playlists or tracks available');
    }

    return tracks;
  } else {
    throw Exception('Failed to load tracks');
  }
}
}
