import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/controller/brand%20controller/brand%20controller.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/components/component.dart';

import '../../all home features/Model/Brand Model.dart';

class BrandView extends StatefulWidget {
  const BrandView({Key? key}) : super(key: key);

  @override
  State<BrandView> createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {

  BrandController brandController = Get.find();

  @override
  Widget build(BuildContext context) {


    return GetBuilder<BrandController>(

        builder: (brand){
          if(brand.isError){
            return const RobotoText(text: "Please check your internet connection", size: 16, fontWeight: null);
          }
          if(brand.brandModel == null){
            return const Center(child: CircularProgressIndicator(),);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: RobotoText(text: "Brands", size: 16.0, fontWeight: FontWeight.w500, color: Colors.black,),
              ),
              CarouselSlider.builder(
                //1st Image of Slider
                //Slider Container properties
                options: CarouselOptions(
                  height: 100.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 9 / 16,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.33,
                ),
                itemCount: brand.brandModel!.brands.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Card(
                    elevation: 1.5,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://readyelectronics.com.bd/${brand.brandModel!.brands[index].image}"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
    });
  }
}
