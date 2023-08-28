import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/pages/practice%20details.dart';

import '../cart/screen/CartButton.dart';
import '../components/colors.dart';
import '../components/component.dart';
import '../Model/favorite item model.dart';
import 'front_end_page_view/Detailed Page.dart';
import '../provider class/Data Class.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  final List<FavItem> favItemList = [
    FavItem(
      image: "assets/image/ready_product1.jpg",
      productName:
          "60W Soldering Iron XCY 908 Adjustable 200-450 Degree Celsius Temperature Control Hand Tools High Insulated",
      price: "400",
      priceAfterDiscount: "325",
    ),
    FavItem(
      image: "assets/image/ready_product2.jpg",
      productName:
          "AA, AAA, 9V Battery Charger, AA Battery Charger, AAA Battery Charger, Doublepow UK95 Smart Charger With LCD Display And LED Indicator",
      price: "700",
      priceAfterDiscount: "620",
    ),
    FavItem(
      image: "assets/image/ready_product3.jpg",
      productName: "MICROTEK IPS UPS SOLAR PCU 1235 12V",
      price: "17500",
      priceAfterDiscount: "16250",
    ),
    FavItem(
      image: "assets/image/ready_product4.jpg",
      productName: "KILOOHM (KΩ) 0.25W RESISTORS - PACK OF 5pcs",
      price: "5",
      priceAfterDiscount: "3 ",
    ),
    FavItem(
      image: "assets/image/ready_product5.jpg",
      productName:
          "3S 11.1V 12V 12.6V Lithium Battery Protection Board Overcharged Over-Discharge Short-Circuit Function 10A Current, 3S Battery Pack",
      price: "350",
      priceAfterDiscount: "180",
    ),
    FavItem(
      image: "assets/image/ready_product6.jpg",
      productName:
          "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
      price: "680",
      priceAfterDiscount: "400",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.75,
        iconTheme: const IconThemeData(color: custom),
        backgroundColor: Colors.white,
        title: Container(
          height: 80.0,
          width: 80.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/ready_logo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PracticeFavorite()));
              },
              child: const Icon(
                Icons.favorite,
                size: 40.0,
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, index) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5000,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: Container(
                              color: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.delete, color: Colors.white),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text('Move to trash',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            key: ValueKey(favItemList[index]),
                            onDismissed: (DismissDirection direction) {
                              setState(() {
                                favItemList.removeAt(index);
                              });
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                        "Remove from the favorite list"),
                                    content: const Text(
                                        "Are you sure you want to remove this item?"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                            value.removeFavCounter();
                                          },
                                          child: const Text("Yes")),
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("No"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 130.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
//product image
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                                  3 -
                                              10,
                                      width: MediaQuery.of(context).size.width /
                                              3 -
                                          10,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(value.image),
                                          fit: BoxFit.fill,
                                          filterQuality: FilterQuality.high,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 10.0,
                                    ),

// product details
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10.0,
                                        ),
//product name
                                        SizedBox(
                                          height: 72.0,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5 -
                                              20,
                                          child: Text(
                                            value.productName,
                                            maxLines: 4,
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),

//price and price after discount
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 50.0,
                                              child: Text(
                                                "৳ ${value.totalPrice}",
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 13.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            SizedBox(
                                                width: 50.0,
                                                child: RobotoText(
                                                  text:
                                                      "৳ ${favItemList[index].priceAfterDiscount}",
                                                  size: 13.0,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.red,
                                                )),
                                            const SizedBox(width: 15.0),
//add to car
//                                             const AddToCartButton(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10.0,
                          );
                        },
                        itemCount: value.getFavCounter()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
