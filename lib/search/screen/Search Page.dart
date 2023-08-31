import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/search/controller/search_controller.dart';
import '../../components/component.dart';
import '../../view/front_end_page_view/Detailed Page.dart';
import '../model/search_model.dart';
import '../../components/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ProductSearchController searchController = Get.put(ProductSearchController());

  @override
  void initState() {
    searchController.fetchSearchData("Battery");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Container(
          height: 50.0,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: custom, size: 26.0,),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(30.0),
              )
            ),
            onChanged: (key) => searchController.fetchSearchData(key),
          ),
        ),
      ),
      body: GetBuilder<ProductSearchController>(
        init: ProductSearchController(),
        builder: (productSearch) {
      if (productSearch.isError || productSearch.searchModel == null) {
        return const Center(
          child: Text("Product Not Found!"),
        );
      }

      if (!productSearch.isError &&
          productSearch.searchModel!.products!.data!.isEmpty) {
        return const Center(
          child: Text("Product Not Found!"),
        );
      }

      List<Data>? dataList = productSearch.searchModel?.products?.data;

      return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 10.0),
          itemCount: dataList?.length,
          itemBuilder: (context, index) {
            Data product = dataList![index];

            return Card(
              elevation: 1,
              child: ListTile(
                leading: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://readyelectronics.com.bd/${product.image!.image.toString()}"),
                          fit: BoxFit.fill)),
                ),
                title: Text(
                  product.proName.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "৳ ${product.proOldprice}",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      "৳ ${product.proNewprice}",
                      style: GoogleFonts.roboto(
                          fontSize: 15.0,
                          color: custom,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                trailing: TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedPage(
                              image: product.image!.image.toString(),
                              productName: product.proName.toString(),
                              details:
                                  product.proDescription.toString(),
                              oldPrice: product.proOldprice.toString(),
                              newPrice: product.proNewprice.toString(),
                              productId: product.id!))),
                  child: Container(
                      height: 30.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: customAccent),
                      child: const Center(
                          child: RobotoText(
                        text: "Details",
                        size: 16.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ))),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
