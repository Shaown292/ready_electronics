import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/Slider Model.dart';
import '../components/colors.dart';

class FinalSlider extends StatefulWidget {
  const FinalSlider({Key? key}) : super(key: key);

  @override
  State<FinalSlider> createState() => _FinalSliderState();
}

class _FinalSliderState extends State<FinalSlider> {
  Future<SliderModel> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://readyelectronics.com.bd/api/v1/slider'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SliderModel.fromJson(data);
    } else {
      return SliderModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SliderModel>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider.builder(
            //1st Image of Slider
            //Slider Container properties
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
            itemCount: snapshot.data!.sliders.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://readyelectronics.com.bd/${snapshot.data!.sliders[index].image}"),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator(color: custom,));
        }
      },
    );
  }
}
