import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteData{


  static final FavoriteData instance = FavoriteData();

  List< dynamic> tempFavData = [];



  // Future<List<Map<String, dynamic>>> getCardData() => getCardData();

  storeFavData(List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favData', jsonEncode(data));
  }


  Future<List<dynamic>> getFavData() async {
    final prefs = await SharedPreferences.getInstance();
    List< dynamic> jsonData = jsonDecode(prefs.getString('favData') ?? '[]');

    // print("jsonData : $jsonData");
    return jsonData;
  }

}