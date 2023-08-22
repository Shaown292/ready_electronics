import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/Model/Flash%20Sell%20Model.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/components/colors.dart';

import '../components/component.dart';
import '../pages/Detailed Page.dart';
class FlashSellView extends StatefulWidget {
  const FlashSellView({Key? key}) : super(key: key);

  @override
  State<FlashSellView> createState() => _FlashSellViewState();
}

class _FlashSellViewState extends State<FlashSellView> {
  @override
  Widget build(BuildContext context) {
    Future<FlashSellModel> getData() async {

      final response = await http
          .get(Uri.parse("https://readyelectronics.com.bd/api/v1/top-sell"));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        return FlashSellModel.fromJson(data);
      }
      else {
        return FlashSellModel.fromJson(data);
      }
    }
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
      if(snapshot.hasData){
        return SizedBox(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.products.data.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedPage(
                    image: snapshot.data!.products.data[index].image.image,
                    productName: snapshot.data!.products.data[index].proName,
                    oldPrice: snapshot.data!.products.data[index].proOldprice,
                    newPrice:snapshot.data!.products.data[index].proNewprice,
                    details: snapshot.data!.products.data[index].proDescription,
                    productId: snapshot.data!.products.data[index].id,


                  ),
                  ),
                  );
                },
                child: RegularCard(
                  img: "https://readyelectronics.com.bd/${snapshot.data!.products.data[index].image.image}" ,
                  productName: snapshot.data!.products.data[index].proName,
                  productValue: snapshot.data!.products.data[index].proNewprice,
                  valueAfterDiscount: snapshot.data!.products.data[index].proOldprice,
                ),
              );
            }, separatorBuilder: (BuildContext context, int index){
            return const SizedBox(width: 5.0,);
          }, ),
        );
      }
      else{
        return const Center(child: CircularProgressIndicator(color: custom,),);
      }
    });
  }
}
