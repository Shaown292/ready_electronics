import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/components/CartButton.dart';
import 'package:testing_riverpod/pages/cart_page.dart';
import 'package:testing_riverpod/pages/local%20data/cart_data_controller.dart';

import 'package:testing_riverpod/view/Features%20Product.dart';

import '../components/colors.dart';
import '../components/component.dart';
import '../provider class/Data Class.dart';
import 'Cart Data.dart';
import 'local data/favorite data.dart';

class DetailedPage extends StatefulWidget {
  // final FlashSellModel flashSellModel;

  final String image;
  final String productName;
  final String details;
  final String oldPrice;
  final String newPrice;
  final int productId;
  const DetailedPage(
      {Key? key,
      required this.image,
      required this.productName,
      required this.details,
      required this.oldPrice,
      required this.newPrice,
      required this.productId})
      : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {

  bool isTempCartData = true;
  void _show() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Your Product has been added to the cart yay!!!"),
    ));
  }

  void _favShow() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Your Product has been added to the favorite list!!!"),
    ));
  }

  String removeHtmlTags(String input) {
    final RegExp htmlRegExp =
        RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
    String plainText = input.replaceAll(htmlRegExp, '');
    plainText = plainText.replaceAll('\r\n', ' ');
    plainText = plainText.trim();
    return plainText;
  }

  CartDataController cartDataController = Get.put(CartDataController());


  @override
  void initState() {

    cartDataController.onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<CartProvider>(context);
    int price = int.parse(widget.newPrice);
    String name = widget.productName;
    int oldPrice = int.parse(widget.oldPrice);
    String image = "https://readyelectronics.com.bd/${widget.image}";
    int id = widget.productId;

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
      body: SafeArea(
        child: Consumer<CartProviderData>(
          builder: (context, value, index) {
            return ListView(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://readyelectronics.com.bd/${widget.image}"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),

                      //product name
                      child: Text(
                        widget.productName,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 1,
                            )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                  color: custom[100],
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.insights,
                                      color: custom,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    OpenSans(
                                      text: "10101 people recently viewed",
                                      size: 13.0,
                                      color: custom,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(removeHtmlTags(widget.details)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          widget.oldPrice,
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          widget.newPrice,
                                          style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                            fontSize: 16.0,
                                            color: custom,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          context
                                               .read<CartProvider>()
                                              .addCounter();
                                          final data = {
                                            "price": price,
                                            "name": name,
                                            "oldPrice": oldPrice,
                                            "image": image,
                                            "id": id,
                                          };

                                          cartDataController.cardData.add(data);


                                          _show();
                                          // _hiveCreate(data);
                                          // print(CardData.instance.tempCardData);
                                        },
                                        child: Container(
                                          height: 40.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            color: custom[400],
                                          ),
                                          child: const Center(
                                              child: RobotoText(
                                            text: "Add to cart",
                                            size: 15.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final data = {
                                            "price": price,
                                            "name": name,
                                            "oldPrice": oldPrice,
                                            "image": image,
                                            "id": id,
                                          };

                                          List<dynamic> oldFavData =
                                              await FavoriteData.instance
                                                  .getFavData();
                                          if (FavoriteData.instance.tempFavData
                                                  .isEmpty &&
                                              oldFavData.isNotEmpty) {
                                            //  isTempCartData = false;
                                            FavoriteData.instance.tempFavData
                                                .addAll(oldFavData);
                                            await FavoriteData.instance
                                                .storeFavData(FavoriteData.instance.tempFavData);
                                          } else {
                                            FavoriteData.instance.tempFavData
                                                .add(data);
                                            await FavoriteData.instance
                                                .storeFavData(FavoriteData.instance.tempFavData);
                                          }

                                          List<dynamic> myData = await FavoriteData
                                              .instance
                                              .getFavData();
                                          _show();
                                          // _hiveCreate(data);
                                          // print(CardData.instance.tempCardData);
                                        },
                                        child: const Icon(
                                          Icons.favorite_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: AddCard(img: 'assets/image/add.jpg'),
                    ),
                    // const DataList(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RobotoText(
                        text: "Related Product",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: custom,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: FeaturesProductView(),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    // const DataList(),
                  ],
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
