import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/all%20home%20features/controller/flash%20sell%20controller/flash_sell_controller.dart';
import 'package:testing_riverpod/components/colors.dart';
import '../../components/component.dart';
import '../../view/front_end_page_view/Detailed Page.dart';
import '../Model/Flash Sell Model.dart';


class FlashSellView extends StatefulWidget {
  const FlashSellView({Key? key}) : super(key: key);

  @override
  State<FlashSellView> createState() => _FlashSellViewState();
}

class _FlashSellViewState extends State<FlashSellView> {

  FlashSellController flashSellController = Get.find();

  @override
  void initState() {
    flashSellController.fetchFlashSellData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<FlashSellController>(
        builder: (product){
      if(product.isError){
        return const RobotoText(text: "Check your internet connection", size: 16, fontWeight: null);
      }
      if(product.flashSellModel == null){
        return const Center(child: CircularProgressIndicator(),);
      }
      return SizedBox(
        height: 200.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: product.flashSellModel!.products.data.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedPage(
                  image: product.flashSellModel!.products.data[index].image.image,
                  productName: product.flashSellModel!.products.data[index].proName,
                  oldPrice: product.flashSellModel!.products.data[index].proOldprice,
                  newPrice: product.flashSellModel!.products.data[index].proNewprice,
                  details: product.flashSellModel!.products.data[index].proDescription,
                  productId: product.flashSellModel!.products.data[index].id,


                ),
                ),
                );
              },
              child: RegularCard(
                img: "https://readyelectronics.com.bd/${product.flashSellModel!.products.data[index].image.image}" ,
                productName: product.flashSellModel!.products.data[index].proName,
                productValue: product.flashSellModel!.products.data[index].proNewprice,
                valueAfterDiscount: product.flashSellModel!.products.data[index].proOldprice,
              ),
            );
          }, separatorBuilder: (BuildContext context, int index){
          return const SizedBox(width: 5.0,);
        }, ),
      );
    });
  }
}
