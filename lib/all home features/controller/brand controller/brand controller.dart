
import 'dart:convert';
import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Features%20Product%20Model.dart';
import 'package:http/http.dart' as http;

import '../../Model/Brand Model.dart';

class BrandController extends GetxController {


  @override
  void onInit() {
    fetchBrandData();
    super.onInit();
  }


  BrandModel? brandModel;
  String errorMessage = "";
  bool isError = false;

  void fetchBrandData() async {

    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/brands"),
      );


      if(response.statusCode==200){

        brandModel = BrandModel.fromJson(jsonDecode(response.body));
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