
import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Banner%20Model.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Slider%20Model.dart';
import 'package:http/http.dart' as http;

class BannerController extends GetxController {


  @override
  void onInit() {
    fetchBannerData();
    super.onInit();
  }


  BannerModel? bannerModel;
  String errorMessage = "";
  bool isError = false;

  void fetchBannerData() async {

    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/slider"),
      );


      if(response.statusCode==200){

        bannerModel = BannerModel.fromJson(jsonDecode(response.body));
        isError = false;
        update();
      }
      else{

        isError = true;
        errorMessage = response.body.toString();
        update();

      }
    } catch(e,tr){

      isError = true;
      errorMessage = e.toString();
      update();

    }
  }

}