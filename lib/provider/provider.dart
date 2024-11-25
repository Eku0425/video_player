import 'package:flutter/cupertino.dart';

import '../api_helper/song_helper.dart';
import '../modal/song_modal.dart';

class SearchProvider extends ChangeNotifier {
  String search = '';
  String recentSearch = '';
  List searchList = [];
  SongModal? songModal;
  SongModal? searchSongModel;
  SearchApiService searchApiService = SearchApiService();
  Future<void> getDataApi() async {
    Map<String, dynamic> json = await searchApiService.fetchData(search);
    searchSongModel = SongModal.fromJson(json);
    notifyListeners();
  }

  Future<void> fetchData() async {
    Map<String, dynamic> json = await searchApiService.fetchData(recentSearch);
    searchSongModel = SongModal.fromJson(json);
    notifyListeners();
  }

  void removeData(int index) {
    searchList.removeAt(index);
    notifyListeners();
  }

  void searchSong(String songs) {
    search = songs;
    notifyListeners();
  }

  SearchProvider() {
    getDataApi();
  }
  bool isLike = false;
  void favorite() {
    isLike = !isLike;
    notifyListeners();
  }
}
