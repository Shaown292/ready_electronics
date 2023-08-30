
import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Slider%20Model.dart';
import 'package:http/http.dart' as http;

class SliderController extends GetxController {


  @override
  void onInit() {
    fetchSliderData();
    super.onInit();
  }


  SliderModel? sliderModel;
  String errorMessage = "";
  bool isError = false;

  void fetchSliderData() async {

    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/slider"),
      );


      if(response.statusCode==200){

        sliderModel = SliderModel.fromJson(jsonDecode(response.body));
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