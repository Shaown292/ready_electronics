import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/Model/Brand%20Model.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/components/component.dart';

class BrandView extends StatelessWidget {
  const BrandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<BrandModel> getData() async {
      final response = await http
          .get(Uri.parse('https://readyelectronics.com.bd/api/v1/brands'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return BrandModel.fromJson(data);
      } else {
        return BrandModel.fromJson(data);
      }
    }

    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                  itemCount: snapshot.data!.brands.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Card(
                      elevation: 1.5,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://readyelectronics.com.bd/${snapshot.data!.brands[index].image}"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: custom,
              ),
            );
          }
        });
  }
}
