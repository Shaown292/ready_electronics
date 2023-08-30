
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Flash%20Sell%20Model.dart';

class FlashSellController extends GetxController{

@override
  void onInit() {

    fetchFlashSellData();
    super.onInit();
  }

  FlashSellModel? flashSellModel;


  String errorMessage = "";
  bool isError = false;



 void fetchFlashSellData() async{

   try{
     http.Response response = await http.get(
       Uri.parse("https://readyelectronics.com.bd/api/v1/top-sell"),
     );

     if(response.statusCode == 200){

       flashSellModel = FlashSellModel.fromJson(jsonDecode(response.body.toString()));
       isError = false;
       update();
     }
     else{
       isError = true;
       errorMessage = response.body.toString();
       update();
     }

   }catch(e){
     isError = true;
     errorMessage = e.toString();
     update();
   }
 }


}