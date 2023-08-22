import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:testing_riverpod/Nav_Drawer.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/components/progress%20bar.dart';
import 'package:testing_riverpod/pages/Checkout%20Page.dart';
import 'package:testing_riverpod/pages/Detailed%20Page.dart';
import 'package:testing_riverpod/pages/EmptyCard.dart';
import 'package:testing_riverpod/pages/local%20data/cart_data_controller.dart';
import '../components/CartButton.dart';
import '../components/colors.dart';
import '../provider class/Data Class.dart';
import '../view/log in otp.dart';
import 'Cart Data.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _show() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Snap!!! Your item has been deleted"),
    ));
  }

  int count = 1;

  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RobotoText(
          text: "Cart",
          size: 20.0,
          fontWeight: FontWeight.bold,
          color: custom,
        ),
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: custom),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 360.0,
                  child: GetBuilder<CartDataController>(
                      init: CartDataController(),
                      builder: (data) {
                        return ListView.builder(
                            itemCount: data.cardData.length,
                            itemBuilder: (context, index) {
                              //  Map <String, dynamic> data = snapshot.data
                              var product = data.cardData[index].values.toList();
                              // var price = product[0];
                              totalPrice += product[0];
                              return Card(
                                elevation: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(product[3]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 70.0,
                                    ),
                                    title: Text(
                                      product[1].toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          product[2].toString(),
                                          style: GoogleFonts.roboto(
                                            textStyle: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 14.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        RobotoText(
                                          text: product[0].toString(),
                                          size: 15.0,
                                          fontWeight: FontWeight.normal,
                                          color: custom,
                                        ),
                                      ],
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () {
                                        context.read<CartProvider>().removeCounter();
                                        data.removeCardData(index);
                                        },
                                      child: const Icon(
                                        Icons.delete,
                                        size: 25.0,
                                        color: custom,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }),
                ),
                Consumer<AddDetailsProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return SizedBox(
                      height: 80.0,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.location_on, color: custom),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Container(
                                    height: 20.0,
                                    width: 48.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: custom),
                                    child: const Center(
                                        child: RobotoText(
                                      text: "Home",
                                      size: 11.0,
                                      fontWeight: null,
                                      color: Colors.white,
                                    )),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RobotoText(
                                      text: value.name,
                                      size: 14.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  RobotoText(
                                      text: value.mobile,
                                      size: 13.0,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black),
                                  RobotoText(
                                      text: value.address,
                                      size: 13.0,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black),
                                ],
                              ),
                              const SizedBox(
                                width: 40.0,
                              ),
                              Container(
                                height: 24.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: custom[200],
                                ),
                                child: const Center(
                                  child: RobotoText(
                                    text: "Change",
                                    fontWeight: FontWeight.w500,
                                    color: custom,
                                    size: 11.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 160.0,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          DottedBorder(
                            color: custom,
                            strokeWidth: 1,
                            child: Container(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width,
                              color: custom.shade100,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10.0),
                                  const Icon(
                                    Icons.monetization_on_sharp,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  RobotoText(
                                    // text: "",
                                    text:
                                        "You're saving $totalPrice in this order",
                                    size: 13.0,
                                    fontWeight: null,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //Sub Total
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RobotoText(
                                  text: "Sub Total",
                                  size: 13.0,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black),
                              RobotoText(
                                  // text: value.totalPrice.toString(),
                                  text: "",
                                  size: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ],
                          ),
                          const SizedBox(height: 10.0),

                          //Discount
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RobotoText(
                                  text: "Discount Applied",
                                  size: 13.0,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black),
                              RobotoText(
                                  // text: value.oldPrice - value.totalPrice,
                                  text: "",
                                  size: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RobotoText(
                                text: "Amount Payable",
                                size: 14.0,
                                fontWeight: FontWeight.w500,
                                color: custom,
                              ),
                              RobotoText(
                                text: "",
                                // text: value.totalPrice.toString(),
                                size: 14.0,
                                fontWeight: FontWeight.w500,
                                color: custom,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  userLoggedIn();
                },
                child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: custom,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RobotoText(
                                  text: "",
                                  // text: value.totalPrice.toString(),
                                  size: 13.0,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                ),
                                RobotoText(
                                  text: "View Details",
                                  size: 13.0,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          RobotoText(
                            text: "PROCEED TO CHECKOUT",
                            size: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void userLoggedIn() {
    if (NavDrawerState.KEYLOGIN == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CheckOutPage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LogInOTP()));
      const snackDemo = SnackBar(
        content: Text('You need to log in first'),
        backgroundColor: custom,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackDemo);
    }
  }
}
