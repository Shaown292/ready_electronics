import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/Model/All%20Category%20Model.dart';
import 'package:testing_riverpod/Model/Home%20Product%20Model.dart';

class ProductRepository {
  static var client = http.Client();

  static Future <List<HomeProductModel>> fetchAllProduct () async{

    var response =  await client.get(Uri.parse("https://readyelectronics.com.bd/api/v1/home-product"));


    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      List<HomeProductModel> homeProductModelList = [];
      for ( var u in data){
        HomeProductModel homeProductModel = HomeProductModel.fromJson(u);
        homeProductModelList.add(homeProductModel);
      }
      // return homeProductModelList;
      return (data as List).map((e) => HomeProductModel.fromJson(e)).toList();
    }
    else {
      return [];
    }
  }
}