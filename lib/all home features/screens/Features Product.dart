import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/all%20home%20features/controller/features%20product%20controller/features_product_controller.dart';
import 'package:testing_riverpod/components/colors.dart';
import '../../components/component.dart';
import '../../view/front_end_page_view/Detailed Page.dart';
import '../Model/Features Product Model.dart';


class FeaturesProductView extends StatefulWidget {
  const FeaturesProductView({Key? key}) : super(key: key);

  @override
  State<FeaturesProductView> createState() => _FeaturesProductViewState();
}

class _FeaturesProductViewState extends State<FeaturesProductView> {


  FeaturesProductController featuresProductController = Get.find();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<FeaturesProductController>(builder: (featuresProduct){

      if(featuresProduct.isError){
        return const RobotoText(text: "Check Your Internet", size: 16, fontWeight: null);
      }
      if(featuresProduct.featuresProductModel == null){
        return const Center(child: CircularProgressIndicator(),);
      }
      return SizedBox(
        height: 200.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: featuresProduct.featuresProductModel!.featurproducts.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedPage(
                  image: featuresProduct.featuresProductModel!.featurproducts[index].image.image,
                  productName: featuresProduct.featuresProductModel!.featurproducts[index].proName,
                  oldPrice: featuresProduct.featuresProductModel!.featurproducts[index].proOldprice,
                  newPrice: featuresProduct.featuresProductModel!.featurproducts[index].proNewprice,
                  details: featuresProduct.featuresProductModel!.featurproducts[index].proDescription,
                  productId: featuresProduct.featuresProductModel!.featurproducts[index].id,

                ),
                ),
                );
              },
              child: RegularCard(
                img: "https://readyelectronics.com.bd/${featuresProduct.featuresProductModel!.featurproducts[index].image.image}" ,
                productName: featuresProduct.featuresProductModel!.featurproducts[index].proName,
                productValue: featuresProduct.featuresProductModel!.featurproducts[index].proOldprice,
                valueAfterDiscount: featuresProduct.featuresProductModel!.featurproducts[index].proNewprice,
              ),
            );
          }, separatorBuilder: (BuildContext context, int index){
          return const SizedBox(width: 5.0,);
        }, ),
      );
    }
    );
  }
}
