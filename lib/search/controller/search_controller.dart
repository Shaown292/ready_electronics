
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/search_model.dart';

class ProductSearchController extends GetxController{

     SearchModel? searchModel;

     String errorMessage = "";
     bool isError = false;

     @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

     void fetchSearchData(String productName) async {

       searchModel = null;
       update();

       try{
         http.Response response = await http.get(
           Uri.parse("https://readyelectronics.com.bd/api/v1/search/$productName"),
         );


         if(response.statusCode==200){

           searchModel = SearchModel.fromJson(jsonDecode(response.body));
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