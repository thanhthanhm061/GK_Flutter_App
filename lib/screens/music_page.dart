import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  final String songTitle;
  final String artistName;

  const MusicPage({super.key, required this.songTitle, required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(songTitle, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/drake.png', height: 250), 
          const SizedBox(height: 20),
          Text(
            songTitle,
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            artistName,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          const SizedBox(height: 40),
          // Playback controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: const Icon(Icons.skip_previous, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.play_circle_fill, color: Colors.green, size: 64), onPressed: () {}),
              IconButton(icon: const Icon(Icons.skip_next, color: Colors.white), onPressed: () {}),
            ],
          ),
          const SizedBox(height: 20),
          // Playback slider
          Slider(
            value: 0.5,
            onChanged: (value) {},
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
