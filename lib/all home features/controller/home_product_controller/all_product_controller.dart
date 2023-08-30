
import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Slider%20Model.dart';
import 'package:http/http.dart' as http;

import '../../Model/Home Product Model.dart';

class HomeProductController extends GetxController {


  @override
  void onInit() {
    homeProductData();
    super.onInit();
  }

  HomeProductModel? homeProductModel;
  String errorMessage = "";
  bool isError = false;

  void homeProductData() async {

    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/home-product"),
      );


      if(response.statusCode==200){

        homeProductModel = HomeProductModel.fromJson(jsonDecode(response.body));
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