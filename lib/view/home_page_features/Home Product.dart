import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:testing_riverpod/components/component.dart';

import '../../Model/Home Product Model.dart';
import '../front_end_page_view/Detailed Page.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    Future<HomeProductModel> getData() async {
      final response = await http.get(
          Uri.parse("https://readyelectronics.com.bd/api/v1/home-product"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return HomeProductModel.fromJson(data);
      } else {
        return HomeProductModel.fromJson(data);
      }
    }

    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 2080,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.homeproducts.length,
                itemBuilder: (context, homeProIndex) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RobotoText(
                              text: snapshot
                                  .data!.homeproducts[homeProIndex].name,
                              size: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            // const RobotoText(
                            //   text: "View All",
                            //   size: 14.0,
                            //   fontWeight: FontWeight.normal,
                            //   color: custom,
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.homeproducts[homeProIndex]
                                .products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedPage(
                                    // flashSellModel: snapshot.data!,
                                    image: snapshot.data!.homeproducts[homeProIndex].products[index].image.image,
                                    productName: snapshot.data!.homeproducts[homeProIndex].products[index].proName,
                                    oldPrice: snapshot.data!.homeproducts[homeProIndex].products[index].proOldprice,
                                    newPrice:snapshot.data!.homeproducts[homeProIndex].products[index].proNewprice,
                                    details: snapshot.data!.homeproducts[homeProIndex].products[index].proDescription,
                                    productId:snapshot.data!.homeproducts[homeProIndex].products[index].id,
                                  ),
                                  ),
                                  );
                                },
                                child: RegularCard(
                                    img:
                                        "https://readyelectronics.com.bd/${snapshot.data!.homeproducts[homeProIndex].products[index].image.image}",
                                    productName: snapshot
                                        .data!
                                        .homeproducts[homeProIndex]
                                        .products[index]
                                        .proName,
                                    productValue: snapshot
                                        .data!
                                        .homeproducts[homeProIndex]
                                        .products[index]
                                        .proOldprice,
                                    valueAfterDiscount: snapshot
                                        .data!
                                        .homeproducts[homeProIndex]
                                        .products[index]
                                        .proNewprice),
                              );
                            }),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20.0,
                  );
                },
              ),
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
