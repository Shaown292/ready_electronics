import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Model/Banner Model.dart';
import '../../components/colors.dart';

class SpecialBanner extends StatelessWidget {
  Future<SpecialBannerModel> _getData() async {
    final response = await http.get(
        Uri.parse('https://readyelectronics.com.bd/api/v1/all-category'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SpecialBannerModel.fromJson(data);
    } else {
      return SpecialBannerModel.fromJson(data);
    }
  }
  const SpecialBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (context, snapshot){
      if (snapshot.hasData){
        return ListView.separated(

            itemBuilder: (context, index){

        }, separatorBuilder:
          (BuildContext context, int index){
            return const SizedBox(height: 10.0,);
          }
        , itemCount: 2);
      }
      else {
        return const Center(child: CircularProgressIndicator(color: custom,),);
      }
    });
  }
}
