import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/Invoice/invoice%20controller/invoice_controller.dart';
import 'package:testing_riverpod/Invoice/invoice%20model/invoice_model.dart';

import '../../cart/screen/CartButton.dart';
import '../../components/colors.dart';
import '../../components/component.dart';
import '../../track order/track order screen/track_order_screen.dart';

class MyInvoice extends StatefulWidget {
  MyInvoice({Key? key, required this.orderId}) : super(key: key);

  String orderId;

  @override
  State<MyInvoice> createState() => _MyInvoiceState();
}

class _MyInvoiceState extends State<MyInvoice> {
  InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  void initState() {
    invoiceController.fetchInvoiceData(widget.orderId);
    super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 100.0,
                    width: 150.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/ready_logo.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                GetBuilder<InvoiceController>(
                    builder: (track){
                      if (track.isError) {
                        return const Text("");
                      }
                      if(track.invoiceDataModel == null){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      return Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>  TrackOrderScreen(trackId: track.invoiceDataModel!.orderInfo!.trackingId.toString(),))),
                          child: Container(
                            height: 45.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: customAccent
                            ),
                            child: const Center(child: RobotoText(text: "Track order", size: 18.0, fontWeight: FontWeight.w300, color: Colors.black,)),
                          ),
                        ),
                      );
                    },

                ),
              ],
            ),
            const Center(
              child: RobotoText(
                text: "Invoice",
                size: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            GetBuilder<InvoiceController>(builder: (invoiceInfo) {

              if (invoiceInfo.isError) {

                return Text(invoiceInfo.errorMessage);
              }
              if(invoiceInfo.invoiceDataModel== null){
                return const Center(child: CircularProgressIndicator(),);
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //name and address of the customer
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const RobotoText(
                            text: "Name: ",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: invoiceInfo
                                .invoiceDataModel!.orderInfo!.shipping!.name,
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          const RobotoText(
                            text: "Address: ",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: invoiceInfo
                                .invoiceDataModel!.orderInfo!.shipping!.address,
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          const RobotoText(
                            text: "Phone no: ",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: invoiceInfo
                                .invoiceDataModel!.orderInfo!.shipping!.phone,
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),

                  //invoice no and date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const RobotoText(
                            text: "Invoice no",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: invoiceInfo
                                .invoiceDataModel!.orderInfo!.orderIdPrimary,
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          const RobotoText(
                            text: "Date:",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: invoiceInfo
                                .invoiceDataModel!.orderInfo!.createdAt,
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey.shade300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: const RobotoText(
                        text: "Items",
                        size: 16.0,
                        fontWeight: null,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RobotoText(
                            text: "Price",
                            size: 16.0,
                            fontWeight: null,
                            color: Colors.white,
                          ),
                          RobotoText(
                            text: "Quantity",
                            size: 16.0,
                            fontWeight: null,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            GetBuilder<InvoiceController>(
                builder: (invoiceItems) {
              if (invoiceItems.isError) {
                return RobotoText(
                    text: invoiceItems.errorMessage,
                    size: 18,
                    fontWeight: FontWeight.w300);
              }
              if (invoiceItems.invoiceDataModel == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: invoiceItems.invoiceDataModel!.orderInfo!.orderdetails!.length,
                itemBuilder: (context, index) {

                  Orderdetails orderDetails = invoiceItems.invoiceDataModel!.orderInfo!.orderdetails![index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 25,
                              child: RobotoText(
                                text: orderDetails.productName.toString(),
                                size: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 25,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    orderDetails
                                        .productPrice
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    orderDetails
                                        .productQuantity
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10.0,);
              },
              );
            }),
            const SizedBox(height: 5.0,),
            Divider(
              thickness: 5.0,
              color: Colors.blueGrey.shade400,
            ),
            GetBuilder<InvoiceController>(

                builder: (total){
                  if(total.isError){
                    return RobotoText(
                        text: total.errorMessage,
                        size: 18,
                        fontWeight: FontWeight.w300);
                  }
                  if(total.invoiceDataModel == null){
                    return const Center(child: CircularProgressIndicator(),);
                  }

                  return Column(
                    children: [

                      //sub total
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const RobotoText(
                              text: "Sub Total",
                              size: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 50.0),
                              child: RobotoText(
                                text: total.invoiceDataModel?.orderInfo?.orderTotal,
                                size: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0,),

                      //shipping fee
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const RobotoText(
                              text: "Shipping Fee",
                              size: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 100.0),
                              child: RobotoText(
                                text: total.invoiceDataModel?.orderInfo?.shipping!.shippingfee.toString(),
                                size: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0,),

                      //discount
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const RobotoText(
                              text: "Discount",
                              size: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 90.0),
                              child: RobotoText(
                                text: total.invoiceDataModel?.orderInfo?.discount.toString(),
                                size: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Divider(
                        thickness: 5.0,
                        color: Colors.blueGrey.shade400,
                      ),
                      const SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const RobotoText(
                              text: "Grand Total",
                              size: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 50.0),
                              child: RobotoText(
                                text: total.invoiceDataModel?.orderInfo?.orderTotal,
                                size: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0,),
                    ],
                  );
                }


            ),
          ],
        ),
      ),
    );
  }
}
