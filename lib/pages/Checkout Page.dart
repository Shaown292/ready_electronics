import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/component.dart';

import '../components/CartButton.dart';
import '../components/colors.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: custom),
        title: const RobotoText(text: "Checkout", size: 16.0, color: custom, fontWeight: FontWeight.w500),
        backgroundColor: Colors.white,
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80.0,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on,
                                color: custom),
                            const SizedBox(height: 5.0,),
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
                        const SizedBox(width: 20.0,),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RobotoText(
                                text: "Full Name",
                                size: 14.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                            RobotoText(
                                text: "Mobile Number",
                                size: 13.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                            RobotoText(
                                text: "Address",
                                size: 13.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ],
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                 TextField(
                  controller: TextEditingController(
                  ),
                   decoration: InputDecoration(
                     enabledBorder:  OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.grey),
                       borderRadius: BorderRadius.circular(10.0),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.grey.shade400,
                       ),
                     ),
                     hintText: "Write here any additional info",
                     hintStyle: TextStyle(color: Colors.grey[500]),

                   ),
                   maxLines: 5,
                ),
                const SizedBox(height: 20.0,),
                Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0),
                            bottom: Radius.circular(0.0),),
                          color: custom.shade100,
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10.0,),
                                Icon(Icons.payments_outlined, color: custom[400],size: 36.0,),
                                const SizedBox(width: 10.0,),
                                const RobotoText(text: "To be paid", size: 18.0, fontWeight: FontWeight.bold, color: custom,),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: RobotoText(text: "139", size: 18.0, fontWeight: FontWeight.bold, color: custom,),
                            ),
                          ],
                        ),
                      ),
                      const CustomCheckBox(),

                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: custom,
                  ),
                  child: const Center(
                    child: RobotoText(text: "Place Order",
                      size: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
