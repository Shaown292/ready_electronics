import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/all%20home%20features/Model/Home%20Product%20Model.dart';
import 'package:testing_riverpod/all%20home%20features/controller/home_product_controller/all_product_controller.dart';
import '../../components/colors.dart';
import '../../components/component.dart';
import '../../view/front_end_page_view/Detailed Page.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  HomeProductController homeProductController = Get.find();

  @override
  void initState() {
    homeProductController.homeProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeProductController>(builder: (product) {
      if (product.isError) {
    return const RobotoText(
        text: "Check your internet connections",
        size: 16,
        fontWeight: null);
      }
      if (product.homeProductModel == null) {
    return const Center(
      child: CircularProgressIndicator(),
    );
      }
        return SizedBox(
          height: 2080,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: product.homeProductModel!.homeproducts.length,
            itemBuilder: (context, homeProIndex) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RobotoText(
                          text: product.homeProductModel!.homeproducts[homeProIndex].name,
                          size: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.homeProductModel!.homeproducts[homeProIndex]
                            .products.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailedPage(
                                // flashSellModel: snapshot.data!,
                                image: product.homeProductModel!.homeproducts[homeProIndex].products[index].image.image,
                                productName: product.homeProductModel!.homeproducts[homeProIndex].products[index].proName,
                                oldPrice: product.homeProductModel!.homeproducts[homeProIndex].products[index].proOldprice,
                                newPrice: product.homeProductModel!.homeproducts[homeProIndex].products[index].proNewprice,
                                details: product.homeProductModel!.homeproducts[homeProIndex].products[index].proDescription,
                                productId:  product.homeProductModel!.homeproducts[homeProIndex].products[index].id,
                              ),
                              ),
                              );
                            },
                            child: RegularCard(
                                img:
                                "https://readyelectronics.com.bd/${product.homeProductModel!.homeproducts[homeProIndex].products[index].image.image}",
                                productName: product
                                    .homeProductModel!
                                    .homeproducts[homeProIndex]
                                    .products[index]
                                    .proName,
                                productValue:product
                                    .homeProductModel!
                                    .homeproducts[homeProIndex]
                                    .products[index]
                                    .proOldprice,
                                valueAfterDiscount:product.homeProductModel!
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

    });
  }
}
