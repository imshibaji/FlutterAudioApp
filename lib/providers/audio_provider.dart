import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioProvider = ChangeNotifierProvider((ref) => AudioNotifier());

class AudioNotifier extends ChangeNotifier {
  List<String> playlist = ['audios/song1.mp3', 'audios/song2.mp3'];
  String audio = '';
  int _index = 0;

  AudioNotifier() {
    audio = playlist[_index];
  }

  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  void setAudio(String audio) {
    this.audio = audio;
    notifyListeners();
  }

  String getAudio() {
    return audio;
  }

  void addSong(String song) {
    playlist.add(song);
    notifyListeners();
  }

  void setSong(int index) {
    audio = playlist[index];
  }

  String getSong(int index) {
    audio = playlist[index];
    return audio;
  }

  List<String> getPlaylist() {
    return playlist;
  }

  int playlistLength() {
    return playlist.length;
  }

  void removeSong(int index) {
    playlist.removeAt(index);
    notifyListeners();
  }

  void removeAudio() {
    audio = '';
    notifyListeners();
  }
}
