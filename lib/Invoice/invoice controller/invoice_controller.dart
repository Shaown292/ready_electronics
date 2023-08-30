
import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_riverpod/Invoice/invoice%20model/invoice_model.dart';

import '../../constants/share_preference_name.dart';
import '../../preferences.dart';
import 'package:http/http.dart' as http;



class InvoiceController extends GetxController {

  InvoiceDataModel? invoiceDataModel ;

  bool isError = false;
  String errorMessage = "";

  void fetchInvoiceData(String orderId) async {


    String token = await MySharedPreferences.getStringData(key: SharedRefName.token)??"";
    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/customer/order/invoice/$orderId"),

        headers: {
          "customer_id" : 315.toString(),
          "Authorization" : "Bearer $token",
        },
      );
      if(response.statusCode==200){

       invoiceDataModel = InvoiceDataModel.fromJson(jsonDecode(response.body.toString()));
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