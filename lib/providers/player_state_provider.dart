import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerStateProvider =
    ChangeNotifierProvider((ref) => PlayerStateNotifier());

class PlayerStateNotifier extends ChangeNotifier {
  double seekbarValue = 0, volumeValue = 0.5, totalDuration = 0;
  bool isPlaying = false, isMuted = false;
  AudioPlayer player = AudioPlayer();

  onload(String songPath) {
    try {
      player.setSourceAsset(songPath).then((value) {
        onProgress();
      });
    } catch (e) {
      log('No Error in onload');
    }
  }

  onProgress() {
    try {
      player.onDurationChanged.listen((event) {
        totalDuration = event.inMilliseconds.toDouble();
        onVolumeChange(volumeValue);
        // print(totalDuration);
        notifyListeners();
      });
      player.onPositionChanged.listen((event) {
        double val = event.inMilliseconds.toDouble() / totalDuration;
        if (val > 0 && val < 1) {
          seekbarValue = val;
        }
        notifyListeners();
      });
      player.onPlayerComplete.listen((event) {
        seekbarValue = 0;
        player.stop();
        isPlaying = false;
        notifyListeners();
      });
    } catch (e) {
      log('No Error in onProgress');
    }
  }

  changeSeekbar(double value) {
    seekbarValue = value;
    player.seek(Duration(milliseconds: (value * totalDuration).toInt()));
    notifyListeners();
  }

  onMute() {
    if (isMuted) {
      player.setVolume(volumeValue);
    } else {
      player.setVolume(0);
    }
    isMuted = !isMuted;
    notifyListeners();
  }

  onVolumeChange(double value) {
    volumeValue = value;
    player.setVolume(value);
    notifyListeners();
  }

  onPlay() {
    try {
      if (isPlaying) {
        player.pause();
      } else {
        player.resume();
      }
      isPlaying = !isPlaying;
      notifyListeners();
    } catch (e) {
      log('No Error in onPlay');
    }
  }

  onStop() {
    try {
      player.stop();
      seekbarValue = 0;
      isPlaying = false;
      notifyListeners();
    } catch (e) {
      log('No Error in onStop');
    }
  }
}
