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
  int totalPrice = 0;
  int totalOldPrice = 0;
  int totalDiscountPrice = 0;


  void addCardData(final data){
    cardData.add(data);
    setTotalPrice();
    storeCardData();
  }

  void setTotalPrice (){

    totalPrice = 0;
    totalOldPrice = 0;
    totalDiscountPrice = 0;
    for (var element in cardData) {

      List temp = element.values.toList();
      totalPrice += int.parse(temp[0].toString());
      totalOldPrice +=  int.parse(temp[2].toString());
      totalDiscountPrice =  totalOldPrice - totalPrice;


      print("total price $totalPrice");
      update();
    }

  }

  void removeCardData(int index){
    cardData.removeAt(index);
    update();
    setTotalPrice();
    storeCardData();
  }


  // Future<List<Map<String, dynamic>>> getCardData() => getCardData();

   void storeCardData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cardData', jsonEncode(cardData));
  }


   void setCardData() async {
    final prefs = await SharedPreferences.getInstance();
    List< dynamic> oldCartData = jsonDecode(prefs.getString('cardData') ?? '[]');
    cardData = oldCartData;

  }
}