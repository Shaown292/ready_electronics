import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteDataController extends GetxController{

  @override
  void onInit() {
    setFavData();
    super.onInit();
  }



  List< dynamic> favData = [];


  void addFavData(final data){
    favData.add(data);
    storeFavData();
  }
  void removeFavData(int index){
    favData.removeAt(index);
    update();
    storeFavData();
  }
  // Future<List<Map<String, dynamic>>> getCardData() => getCardData();

  void storeFavData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favData', jsonEncode(favData));
  }



   void setFavData() async {
    final prefs = await SharedPreferences.getInstance();
    List< dynamic> oldFavData = jsonDecode(prefs.getString('favData') ?? '[]');
    favData = oldFavData;
  }

}