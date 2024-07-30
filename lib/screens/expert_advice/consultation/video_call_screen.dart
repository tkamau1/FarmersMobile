// lib/screens/video_call_screen.dart

import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  final Map<String, String> expert;

  const VideoCallScreen({super.key, required this.expert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Call with ${expert['name']}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.videocam, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              'You are in a video call with ${expert['name']}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
