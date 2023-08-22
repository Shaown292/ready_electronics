import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:testing_riverpod/components/component.dart';
import '../Model/All Category Model.dart';
import '../components/colors.dart';
import 'AllCategoryProductView.dart';

class FrontCategoryView extends StatefulWidget {
  const FrontCategoryView({Key? key}) : super(key: key);

  @override
  State<FrontCategoryView> createState() => _FrontCategoryViewState();
}

class _FrontCategoryViewState extends State<FrontCategoryView> {
  Future<AllCategoryModel> _getData() async {
    final response = await http.get(
        Uri.parse('https://readyelectronics.com.bd/api/v1/all-category'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return AllCategoryModel.fromJson(data);
    } else {
      return AllCategoryModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllCategoryModel>(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  AllCategoryProductView(
                      productID: snapshot.data!.categories[index].id-1,
                      allCategoryModel: snapshot.data!,
                      categoryName: snapshot.data!.categories[index].name,
                      length: snapshot.data!.categories[index].products.length,
                    )));
                  },
                  child: BuildSmallCard(
                      productName: snapshot.data!.categories[index].name,
                      img:
                          "https://readyelectronics.com.bd/${snapshot.data!.categories[index].image}"),
                );
              },
              separatorBuilder: (BuildContext context, int ind) {
                return const SizedBox(
                  width: 10.0,
                );
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: custom,
            ));
          }
        });
  }
}
