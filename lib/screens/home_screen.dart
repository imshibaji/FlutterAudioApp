import 'package:audio_app/providers/audio_provider.dart';
import 'package:audio_app/screens/about.dart';
import 'package:audio_app/widgets/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Home Screen - AudioApp',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const AboutScreen()));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            ListTile(
              title: const Text('Song1'),
              onTap: () {
                ref.read(audioProvider.notifier).setAudio('audios/song1.mp3');
              },
            ),
            ListTile(
              title: const Text('Song2'),
              onTap: () {
                ref.read(audioProvider).setAudio('audios/song2.mp3');
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 100,
        // color: Theme.of(context).colorScheme.onPrimary,
        child: AudioPlayerUI(),
      ),
    );
  }
}
