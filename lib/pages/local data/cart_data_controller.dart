import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartDataController extends GetxController{

  @override
  void onInit() {

    setCardData();
    super.onInit();
  }


  List<dynamic> cardData = [];


  void removeCardData(int index){

    cardData.removeAt(index);
    update();
  }


  // Future<List<Map<String, dynamic>>> getCardData() => getCardData();

   storeCardData(List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cardData', jsonEncode(data));
  }


   void setCardData() async {
    final prefs = await SharedPreferences.getInstance();
    List< dynamic> oldCartData = jsonDecode(prefs.getString('cardData') ?? '[]');

    cardData = oldCartData;

  }
}