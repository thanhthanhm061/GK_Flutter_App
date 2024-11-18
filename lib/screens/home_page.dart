import 'package:flutter/material.dart';
import 'package:flutter_api/screens/music_page.dart';
import 'package:flutter_api/screens/track_list_screen.dart';
import 'package:flutter_api/services/api_service.dart';
import 'package:flutter_api/services/modeltrack.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.search, color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/spotify_logo.png', height: 30),
          ],
        ),
        actions: const [Icon(Icons.more_vert, color: Colors.white)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Album Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Album', style: TextStyle(color: Colors.white, fontSize: 14)),
                        Text('Happier Than Ever', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Billie Eilish', style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Tabs Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        const Text('News', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Container(height: 2, width: 30, color: Colors.green),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrackListScreen()),
                      );
                    },
                    child: const Text('Video', style: TextStyle(color: Colors.grey)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Artists', style: TextStyle(color: Colors.grey)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Podcasts', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Horizontal Scroll Section for Albums
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MusicPage(songTitle: "Bad Guy", artistName: "Billie Eilish")),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/drake.png', height: 100, width: 100),
                          const SizedBox(height: 8),
                          const Text('Bad Guy', style: TextStyle(color: Colors.white, fontSize: 14)),
                          const Text('Billie Eilish', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MusicPage(songTitle: "Scorpion", artistName: "Drake")),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/drake.png', height: 100, width: 100),
                          const SizedBox(height: 8),
                          const Text('Scorpion', style: TextStyle(color: Colors.white, fontSize: 14)),
                          const Text('Drake', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Playlist Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See More',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Playlist Items
              FutureBuilder<List<Track>>(
                future: apiService.fetchTracks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No tracks available.', style: TextStyle(color: Colors.white)));
                  } else {
                    final tracks = snapshot.data!;
                    return Column(
                      children: tracks.map((track) {
                        return ListTile(
                          leading: const Icon(Icons.play_circle_fill, color: Colors.white),
                          title: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MusicPage(
                                    songTitle: track.title,
                                    artistName: track.artist,
                                  ),
                                ),
                              );
                            },
                            child: Text(track.title, style: const TextStyle(color: Colors.white)),
                          ),
                          subtitle: Text(track.artist, style: const TextStyle(color: Colors.grey)),
                          trailing: const Text('3:43', style: TextStyle(color: Colors.grey)), // Adjust duration if available
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, 
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
