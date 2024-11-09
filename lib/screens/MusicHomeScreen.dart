import 'package:flutter/material.dart';

class MusicHomeScreen extends StatelessWidget {
  const MusicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thanh tìm kiếm và logo Spotify
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search, color: Colors.white60),
                  Image.asset('assets/spotify_logo.png', width: 100),
                  const Icon(Icons.more_vert, color: Colors.white60),
                ],
              ),
              const SizedBox(height: 20),
              
              // Phần 'New Album'
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1DB954),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/billie_eilish.png', width: 50),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Album', style: TextStyle(color: Colors.white)),
                        Text('Happier Than Ever', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('Billie Eilish', style: TextStyle(color: Colors.white60)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Tabs (News, Video, Artists, Podcast)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('News', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Video', style: TextStyle(color: Colors.white60)),
                  Text('Artists', style: TextStyle(color: Colors.white60)),
                  Text('Podcast', style: TextStyle(color: Colors.white60)),
                ],
              ),
              const SizedBox(height: 20),

              // Danh sách nghệ sĩ và playlist
              Expanded(
                child: ListView(
                  children: [
                    // Danh sách nghệ sĩ
                    Row(
                      children: [
                        _artistCard('assets/billie_eilish.png', 'Bad Guy', 'Billie Eilish'),
                        _artistCard('assets/drake.png', 'Scorpion', 'Drake'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // Playlist
                    const Text('Playlist', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    _songRow('As It Was', 'Harry Styles', '5:33'),
                    _songRow('God Did', 'DJ Khaled', '3:43'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.white60), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.white60), label: ''),
        ],
      ),
    );
  }

  Widget _artistCard(String image, String song, String artist) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(image, width: 70),
          const SizedBox(height: 5),
          Text(song, style: const TextStyle(color: Colors.white)),
          Text(artist, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }

  Widget _songRow(String song, String artist, String duration) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.play_circle_fill, color: Colors.white),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song, style: const TextStyle(color: Colors.white)),
                Text(artist, style: const TextStyle(color: Colors.white60)),
              ],
            ),
          ],
        ),
        Text(duration, style: const TextStyle(color: Colors.white60)),
      ],
    );
  }
}
