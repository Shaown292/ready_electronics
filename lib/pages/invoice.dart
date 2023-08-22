import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:testing_riverpod/components/component.dart';

import '../components/CartButton.dart';

class MyInvoice extends StatelessWidget {
  const MyInvoice({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              //invoice
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/ready_logo.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Center(
                child: RobotoText(
                  text: "Invoice",
                  size: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),),
              const SizedBox(
                height: 20.0,
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //name and address of the customer
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RobotoText(
                        text: "Mr Jahid Hasan",
                        size: 16.0,
                        fontWeight: FontWeight.w400,
                        color: custom,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RobotoText(
                        text: "16/G Kazi Para",
                        size: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          RobotoText(
                            text: "Phone no",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: "01761321460",
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
                          RobotoText(
                            text: "Invoice no",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: "2125",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          RobotoText(
                            text: "Date:",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: "24-03-2023",
                            size: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 15.0,
              ),

              //product details
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
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            child:  const RobotoText(
                              text: "60W Soldering Iron XCY 908 Adjustable 200-450 Degree Celsius Temperature Control Hand Tools High Insulated",
                              size: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RobotoText(
                                  text: "1",
                                  size: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 70.0,
                                  child: RobotoText(
                                    text: "325",
                                    size: 16.0,
                                    fontWeight:FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            child:  const RobotoText(
                              text: "MICROTEK IPS UPS SOLAR PCU 1235 12V",
                              size: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RobotoText(
                                  text: "2",
                                  size: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 70.0,
                                  child: RobotoText(
                                    text: "16200",
                                    size: 16.0,
                                    fontWeight:FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            child:  const RobotoText(
                              text: "3v To 6v High Speedy DC Motor- 1pcs",
                              size: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 25,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RobotoText(
                                  text: "1",
                                  size: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 70.0,
                                  child: RobotoText(
                                    text: "20",
                                    size: 16.0,
                                    fontWeight:FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              //total amount payable
              Divider(thickness: 5.0, color: Colors.blueGrey.shade400,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RobotoText(text: "Total", size: 16.0, fontWeight: FontWeight.w500, color: Colors.black,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: RobotoText(text: "16545", size: 16.0, fontWeight: FontWeight.w500, color: Colors.black,),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 5.0, color: Colors.blueGrey.shade400,),
              const SizedBox(height: 40.0,),
            ],
          ),
        ),
      ),
    );
  }
}
