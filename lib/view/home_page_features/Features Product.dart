import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/components/colors.dart';

import '../../Model/Features Product Model.dart';
import '../../components/component.dart';
import '../front_end_page_view/Detailed Page.dart';

class FeaturesProductView extends StatefulWidget {
  const FeaturesProductView({Key? key}) : super(key: key);

  @override
  State<FeaturesProductView> createState() => _FeaturesProductViewState();
}

class _FeaturesProductViewState extends State<FeaturesProductView> {


  @override
  Widget build(BuildContext context) {

    Future<FeaturesProductModel> getData() async {

      final response = await http
          .get(Uri.parse("https://readyelectronics.com.bd/api/v1/home-feature-product"));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        return FeaturesProductModel.fromJson(data);
      }
      else {
        return FeaturesProductModel.fromJson(data);
      }
    }
    return FutureBuilder<FeaturesProductModel>(
        future: getData(),
        builder: (context, snapshot){
      if(snapshot.hasData){
        return SizedBox(
          height: 200.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.featurproducts.length,
              itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedPage(
                  image: snapshot.data!.featurproducts[index].image.image,
                  productName: snapshot.data!.featurproducts[index].proName,
                  oldPrice: snapshot.data!.featurproducts[index].proOldprice,
                  newPrice: snapshot.data!.featurproducts[index].proNewprice,
                  details: snapshot.data!.featurproducts[index].proDescription,
                  productId: snapshot.data!.featurproducts[index].id,

                ),
                  ),
                );
              },
              child: RegularCard(
                img: "https://readyelectronics.com.bd/${snapshot.data!.featurproducts[index].image.image}" ,
                productName: snapshot.data!.featurproducts[index].proName,
                productValue: snapshot.data!.featurproducts[index].proOldprice,
                valueAfterDiscount: snapshot.data!.featurproducts[index].proNewprice,
              ),
            );
          }, separatorBuilder: (BuildContext context, int index){
            return const SizedBox(width: 5.0,);
          }, ),
        );
      }
      else {
        return const Center(child: CircularProgressIndicator(color: custom,),);
      }
    });
  }
}
