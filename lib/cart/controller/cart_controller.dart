

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:testing_riverpod/components/progress%20bar.dart';
import 'package:testing_riverpod/components/snack_bar.dart';

import '../../constants/share_preference_name.dart';
import '../../provider class/Data Class.dart';
import '../model/cart_data_display_model.dart';

class CartController extends GetxController {


  @override
  void onInit() {
   fetchCartProducts();
    super.onInit();
  }


  CartDataDisplayModel? cartDataDisplayModel;
  String errorMessage = "";
  bool isError = false;

  void fetchCartProducts() async {

    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/cart"),

        headers: {
          "customer_id" : 315.toString(),
        },
      );
      if(response.statusCode==200){

        cartDataDisplayModel = CartDataDisplayModel.fromJson(jsonDecode(response.body));
        isError = false;
        calculatePrice();
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

  void addToCart( { required String productId, required BuildContext context}) async {

    ProgressBar progressBar = ProgressBar();
    progressBar.showDialogue(widgetContext: context, message: "Please wait", type: SimpleFontelicoProgressDialogType.threelines);
    try{
      http.Response response = await http.post(
        Uri.parse("https://readyelectronics.com.bd/api/v1/cart"),
        body: {
          'verifyPin' : SharedRefName.otp ,
          'product_id' : productId,
        },
        headers: {
          "verifyphone":  SharedRefName.number,
          "Authorization" : "Bearer ${SharedRefName.token}",
          "customer_id" : 315.toString(),
        },
      );
      if(response.statusCode==200){
        fetchCartProducts();
        context.read<CartProvider>().addCounter();
        progressBar.hideDialogue();
        CustomSnackBar(context: context, text: "Your product has been added to the cart" );
      }
      else{
        progressBar.hideDialogue();
        CustomSnackBar(context: context, color: Colors.red, text: "Failed to add product" );

      }
    } catch(e,tr){
      progressBar.hideDialogue();
      CustomSnackBar(context: context, color: Colors.red, text: e.toString() );
    }
  }

  Future<void> productQuantityIncrement({required String productId}) async {

    try{
      http.Response response = await http.put(
        Uri.parse("https://readyelectronics.com.bd/api/v1/cart/increment/$productId"),

        headers: {
          "customer_id" : 315.toString(),
        },
      );
      if(response.statusCode==200){


        fetchCartProducts();
      }
      else{
        log("Cart increment failed : ${response.body.toString()}" );
      }

    } catch(e,tr){

      log("Cart increment exceptions : ${e.toString()}" );

    }
  }


  Future<void> productQuantityDecrement({required String productId}) async {

    try{
      http.Response response = await http.put(
        Uri.parse("https://readyelectronics.com.bd/api/v1/cart/decrement/$productId"),

        headers: {
          "customer_id" : 315.toString(),
        },
      );
      if(response.statusCode==200){


        fetchCartProducts();
      }
      else{
        log("Cart decrement failed : ${response.body.toString()}" );
      }

    } catch(e,tr){

      log("Cart decrement exceptions : ${e.toString()}" );

    }
  }

  double newPrice = 0.0;
  double oldPrice = 0.0;
  double totalDiscountPrice = 0.0;

  void calculatePrice (){

     newPrice = 0.0;
     oldPrice = 0.0;
     totalDiscountPrice = 0.0;
     update();

    for(int item = 0; item < cartDataDisplayModel!.cartData!.length ; item++){



      try {
        CartData cartData = cartDataDisplayModel!.cartData![item];
        Product product = cartData.product!;

        double p1 = (double.parse(product.proOldprice.toString()) * double.parse(cartData.quantity.toString()));
        oldPrice += p1;

        double p2 = (double.parse(product.proNewprice.toString()) * double.parse(cartData.quantity.toString()));

        newPrice += p2;

        double p3 =  p1 - p2;
        totalDiscountPrice += p3;


      }catch(e){
        log("Price calculation error : ${e.toString()}");
        update();
      }

      update();

    }

  }


  Future<void> productDelete({required String productId}) async {

    try{
      http.Response response = await http.delete(
        Uri.parse("https://readyelectronics.com.bd/api/v1/cart/delete/$productId"),

        headers: {
          "customer_id" : 315.toString(),
        },
      );
      if(response.statusCode==200){


        fetchCartProducts();
      }
      else{
        log("Cart Delete failed : ${response.body.toString()}" );
      }

    } catch(e,tr){

      log("Cart delete exceptions : ${e.toString()}" );

    }
  }


  // Future<void> allProductDelete({required String productId}) async {
  //
  //   try{
  //
  //     for(int items =0; items < cartDataDisplayModel!.cartData!.length; items++ ) {
  //
  //       http.Response response = await http.delete(
  //         Uri.parse("https://readyelectronics.com.bd/api/v1/cart/delete/$productId"),
  //
  //         headers: {
  //           "customer_id" : 315.toString(),
  //         },
  //       );
  //       if(response.statusCode==200){
  //
  //         fetchCartProducts();
  //       }
  //       else{
  //         log("Cart All Data erase failed : ${response.body.toString()}" );
  //       }
  //
  //
  //     }
  //
  //
  //   } catch(e,tr){
  //
  //     log("Cart data erase exceptions : ${e.toString()}" );
  //
  //   }
  // }

}

