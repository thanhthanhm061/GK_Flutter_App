import 'package:flutter/material.dart';
import 'package:flutter_api/services/api_service.dart';
import 'package:flutter_api/services/modeltrack.dart';


class TrackListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  TrackListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh Sách Bài Hát')),
      body: FutureBuilder<List<Track>>(
        future: apiService.fetchTracks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error occurred: ${snapshot.error}');
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có bài hát nào.'));
          } else {
            final tracks = snapshot.data!;
            return ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tracks[index].title),
                  subtitle: Text(tracks[index].artist),
                );
              },
            );
          }
        },
      ),
    );
  }
}
