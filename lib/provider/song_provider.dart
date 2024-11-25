import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

import '../api_helper/song_helper.dart';
import '../modal/song_modal.dart';

class SongProvider extends ChangeNotifier {
  SongModal? songModal;
  Result? result;
  Duration? duration;
  int nextSong = 0;
  bool isPlay = false;
  bool repeatSong = false;
  AudioPlayer player = AudioPlayer();

  Future<void> getSong() async {
    ApiService apiService = ApiService();
    Map<String, dynamic> json = await apiService.fetchSong();
    songModal = SongModal.fromJson(json);
    notifyListeners();
  }

  void checkSong() {
    isPlay = !isPlay;
    (isPlay == true) ? player.play() : player.pause();
    notifyListeners();
  }

  void selectSong(Result selectedSong) {
    result = selectedSong;
    notifyListeners();
  }

  void setSongResult(Result song) {
    result = song;
    notifyListeners();
  }

  Future<void> setSong(String url) async {
    duration = await player.setUrl(url);
    notifyListeners();
  }

  Stream<Duration> getCurrentPosition() {
    return player.positionStream;
  }

  Future<void> jumpSong(Duration position) async {
    await player.seek(position);
    notifyListeners();
  }

  SongProvider() {
    getSong();
  }
}
