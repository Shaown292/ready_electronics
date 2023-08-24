import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_riverpod/view/front_end_page_view/Detailed%20Page.dart';

import '../../Model/All Category Model.dart';
import '../../components/CartButton.dart';
import '../../components/colors.dart';
import '../../components/component.dart';

class AllCategoryProductView extends StatefulWidget {
  final AllCategoryModel allCategoryModel;
  final int productID;
  final String categoryName;
  final int length;

  const AllCategoryProductView(
      {Key? key,
      required this.allCategoryModel,
      required this.productID,
      required this.categoryName,
      required this.length})
      : super(key: key);

  @override
  State<AllCategoryProductView> createState() => _AllCategoryProductViewState();
}

class _AllCategoryProductViewState extends State<AllCategoryProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: custom),
        backgroundColor: Colors.white,
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      widget.categoryName,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.5,
                      crossAxisSpacing: 2.5,
                      childAspectRatio: 0.7,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.allCategoryModel
                        .categories[widget.productID].products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailedPage(
                                  image:
                                      widget.allCategoryModel.categories[widget.productID].products[index].images[0].image,
                                  productName: widget
                                      .allCategoryModel
                                      .categories[widget.productID]
                                      .products[index]
                                      .proName,
                                  details: widget
                                      .allCategoryModel
                                      .categories[widget.productID]
                                      .products[index]
                                      .proDescription,
                                  oldPrice: widget
                                      .allCategoryModel
                                      .categories[widget.productID]
                                      .products[index]
                                      .proOldprice,
                                  newPrice: widget
                                      .allCategoryModel
                                      .categories[widget.productID]
                                      .products[index]
                                      .proNewprice,
                                  productId: widget
                                      .allCategoryModel
                                      .categories[widget.productID]
                                      .products[index]
                                      .id,
                            ),
                            ),
                          );
                        },
                        child: CategoryCard(
                          img:
                              "https://readyelectronics.com.bd/${widget.allCategoryModel.categories[widget.productID].products[index].images[0].image}",
                          productName: widget
                              .allCategoryModel
                              .categories[widget.productID]
                              .products[index]
                              .proName,
                          productValue: widget
                              .allCategoryModel
                              .categories[widget.productID]
                              .products[index]
                              .proOldprice,
                          valueAfterDiscount: widget
                              .allCategoryModel
                              .categories[widget.productID]
                              .products[index]
                              .proNewprice,
                        ),
                      );
                    }),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
