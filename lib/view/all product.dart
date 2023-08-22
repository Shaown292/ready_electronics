import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/provider%20class/home%20Product%20provider.dart';

import '../components/colors.dart';
import '../components/component.dart';
import '../pages/Detailed Page.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {

  var productViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    productViewModel = Provider.of<HomeProductProvider>(context, listen: false);
    productViewModel.getAllProduct ();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Consumer<HomeProductProvider>(builder: (context, data, child){
        return ListView.builder(
            itemCount: data.productList.length,
            itemBuilder: (context, index){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RobotoText(
                          text:
                              data.productList[index].homeproducts[index].name,
                          size: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        const RobotoText(
                          text: "View All",
                          size: 14.0,
                          fontWeight: FontWeight.normal,
                          color: custom,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 230.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.productList[index].homeproducts[index]
                            .products.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedPage(
                                // flashSellModel: snapshot.data!,
                                image: data.productList[index].homeproducts[index].products[index].image.image,
                                productName: data.productList[index].homeproducts[index].products[index].proName,
                                oldPrice: data.productList[index].homeproducts[index].products[index].proOldprice,
                                newPrice:data.productList[index].homeproducts[index].products[index].proNewprice,
                                details: data.productList[index].homeproducts[index].products[index].proDescription,
                                productId: data.productList[index].homeproducts[index].products[index].id,
                              ),
                              ),
                              );
                            },
                            child: RegularCard(
                                img:
                                "https://readyelectronics.com.bd/${data.productList[index].homeproducts[index].products[index].image.image}",
                                productName: data.productList[index].homeproducts[index].products[index].proName,
                                productValue: data.productList[index].homeproducts[index].products[index].proOldprice,
                                valueAfterDiscount: data.productList[index].homeproducts[index].products[index].proNewprice),
                          );
                        }),
                  ),
                ],
              );
            }


        );
      })
    ));
  }
}
