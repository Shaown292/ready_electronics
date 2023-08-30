import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/all%20home%20features/controller/front%20category%20controller/front_category_controller.dart';
import 'package:testing_riverpod/components/component.dart';
import '../../../components/colors.dart';
import '../../Model/front_category_model.dart';
import 'AllCategoryProductView.dart';

class FrontCategoryView extends StatefulWidget {
  const FrontCategoryView({Key? key}) : super(key: key);

  @override
  State<FrontCategoryView> createState() => _FrontCategoryViewState();
}

class _FrontCategoryViewState extends State<FrontCategoryView> {


  FrontCategoryController frontCategoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FrontCategoryController>(

        builder: (frontProduct) {
         if(frontProduct.isError){
           return const RobotoText(text: "Please check your internet connection", size: 16, fontWeight: null);
         }
         if(frontProduct.frontCategoryModel == null){
           return const Center(child: CircularProgressIndicator());
         }
         return ListView.separated(
           itemCount: frontProduct.frontCategoryModel!.categories.length,
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {
             return GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>  AllCategoryProductView(
                   productID: frontProduct.frontCategoryModel!.categories[index].id-1,
                   allCategoryModel: frontProduct.frontCategoryModel!,
                   categoryName: frontProduct.frontCategoryModel!.categories[index].name,
                   length: frontProduct.frontCategoryModel!.categories[index].products.length,
                 )));
               },
               child: BuildSmallCard(
                   productName: frontProduct.frontCategoryModel!.categories[index].name,
                   img:
                   "https://readyelectronics.com.bd/${frontProduct.frontCategoryModel!.categories[index].image}"),
             );
           },
           separatorBuilder: (BuildContext context, int ind) {
             return const SizedBox(
               width: 10.0,
             );
           },
         );
        });
  }
}
