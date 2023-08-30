
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/front_category_model.dart';

class FrontCategoryController extends GetxController{

  @override
  void onInit() {

    fetchFrontCategoryData();
    super.onInit();
  }

  FrontCategoryModel? frontCategoryModel;


  String errorMessage = "";
  bool isError = false;



  void fetchFrontCategoryData() async{

    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/all-category"),
      );

      if(response.statusCode == 200){

        frontCategoryModel = FrontCategoryModel.fromJson(jsonDecode(response.body.toString()));
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