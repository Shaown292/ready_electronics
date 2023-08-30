
import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Features%20Product%20Model.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Slider%20Model.dart';
import 'package:http/http.dart' as http;

class FeaturesProductController extends GetxController {


  @override
  void onInit() {
    fetchFeaturesProductData();
    super.onInit();
  }


  FeaturesProductModel?  featuresProductModel;
  String errorMessage = "";
  bool isError = false;

  void fetchFeaturesProductData() async {

    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/home-feature-product"),
      );


      if(response.statusCode==200){

        featuresProductModel= FeaturesProductModel.fromJson(jsonDecode(response.body));
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