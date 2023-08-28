
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing_riverpod/constants/share_preference_name.dart';

import 'package:testing_riverpod/display%20order/display_order_model.dart';
import 'package:testing_riverpod/preferences.dart';


class DisplayOrderController {

   Future<String> fetchOrders() async {

     String token = await MySharedPreferences.getStringData(key: SharedRefName.token)??"";
    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/customer/order"),

        headers: {
          "customer_id" : 315.toString(),
          "Authorization" : "Bearer $token",
        },
      );
      if(response.statusCode==200){


        print("My Order : ${ response.body.toString()}");

        return response.body.toString();

      }
      else{

        return "Error";


      }
    } catch(e,tr){

      return "Error";


    }
  }
}