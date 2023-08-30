
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/all%20home%20features/controller/slider_controller/slider_controller.dart';
import 'package:testing_riverpod/components/component.dart';
import '../../components/colors.dart';
import '../Model/Slider Model.dart';

class FinalSlider extends StatefulWidget {
  const FinalSlider({Key? key}) : super(key: key);

  @override
  State<FinalSlider> createState() => _FinalSliderState();
}

class _FinalSliderState extends State<FinalSlider> {


  SliderController sliderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderController>(builder: (sliders){

      if(sliders.isError){
        return const RobotoText(text: "Check your internet connection", size: 16, fontWeight: null,);
      }
      if(sliders.sliderModel == null){
        return const Center(child: CircularProgressIndicator(),);
      }
      return CarouselSlider.builder(
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1.0,
        ),
        itemCount: sliders.sliderModel!.sliders.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://readyelectronics.com.bd/${sliders.sliderModel!.sliders[index].image}"),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      );
    });

  }
}
