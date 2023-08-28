

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/display%20order/display_order_controller.dart';
import 'package:testing_riverpod/display%20order/display_order_model.dart';

import '../cart/screen/CartButton.dart';
import '../components/colors.dart';
import '../components/component.dart';
import '../data/order data.dart';

class DisplayOrderScreen extends StatefulWidget {
  const DisplayOrderScreen({Key? key}) : super(key: key);

  @override
  State<DisplayOrderScreen> createState() => _DisplayOrderScreenState();
}

class _DisplayOrderScreenState extends State<DisplayOrderScreen> {


  @override
  Widget build(BuildContext context) {

    DisplayOrderController displayOrderController;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: custom),
        title: const RobotoText(text: "My Orders", size: 24.0, fontWeight: FontWeight.bold, color: custom),
        backgroundColor: Colors.white,
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: FutureBuilder(
        future: DisplayOrderController().fetchOrders(),
        builder: (context, snapshot){

          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }

          if(snapshot.data == "Error"){
            return const Center(child: RobotoText(text: "You didn't order yet", size: 30.0, fontWeight: FontWeight.w500, color: custom,),);
          }

          DisplayOrderModel displayOrderModel = DisplayOrderModel.fromJson(jsonDecode(snapshot.data.toString()));


            return ListView.builder(
              reverse: true,
                itemCount: displayOrderModel.orders?.length,
                itemBuilder: (context, index){

                  var data = displayOrderModel.orders![index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Container(
                  color: Colors.white,
                  height: 120.0,
                  width: MediaQuery.of(context).size.width - 140,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RobotoText(
                              text: "Order Id: ${data.orderIdPrimary}",
                              size: 14.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                            RobotoText(
                              text: "Date : ${data.createdAt}",
                              size: 13.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                            RobotoText(
                                text: "Total Price ${data.orderTotal}",
                                size: 16.0,
                                fontWeight: FontWeight.w500,
                                color: custom),
                            RobotoText(
                              text: data.ordertype!.name.toString(),
                              size: 14.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => const MyInvoice()));
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: custom,
                                  ),
                                  child: const Center(
                                    child: RobotoText(
                                      text: "Show Invoice",
                                      size: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                            ),
                            const SizedBox(height: 30.0,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            });

        },
      )
    );
  }
}
