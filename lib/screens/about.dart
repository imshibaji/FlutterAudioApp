import 'package:audio_app/screens/home_screen.dart';
import 'package:audio_app/widgets/audio_player.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:
            const Text('About Screen', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ))
        ],
      ),
      body: const Center(
        child: Text('About Screen'),
      ),
      bottomNavigationBar: const SizedBox(
        height: 100,
        // color: Theme.of(context).colorScheme.onPrimary,
        child: AudioPlayerUI(),
      ),
    );
  }
}
