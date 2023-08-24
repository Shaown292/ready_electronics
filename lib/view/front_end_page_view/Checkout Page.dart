
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/constants/share_preference_name.dart';
import 'package:testing_riverpod/constants/static_variable.dart';
import 'package:testing_riverpod/view/front_end_page_view/AddShippingAddressPage.dart';

import '../../components/CartButton.dart';
import '../../components/colors.dart';
import '../../preferences.dart';

class CheckOutPage extends StatefulWidget {

  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  // final String id;

  String name = "";
  String address = "";
  String phoneNumber = "";

  // @override
  // void initState() {
  //   userInfo();
  //   super.initState();
  // }
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const RobotoText(
                                    text: "Name: ",
                                    size: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),

                                const SizedBox(width: 10.0,),
                                RobotoText(
                                    text: StaticVariables.name,
                                    size: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const RobotoText(
                                    text: "Number: ",
                                    size: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),

                                const SizedBox(width: 10.0,),
                                RobotoText(
                                    text: StaticVariables.mobile,
                                    size: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ],
                            ),
                            Row(
                              children: [
                                const RobotoText(
                                    text: "Address: ",
                                    size: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),

                                const SizedBox(width: 10.0,),
                                RobotoText(
                                    text: StaticVariables.address,
                                    size: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ],
                            ),
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
                GestureDetector(
                  onTap: (){
                    userInfo();
                  },
                  child: Container(
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
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void userInfo() async{
    var name = await MySharedPreferences.getStringData(key: SharedRefName.name)??"";
    var address = await MySharedPreferences.getStringData(key: SharedRefName.address)??"";
    String? phoneNumber = await MySharedPreferences.getStringData(key: SharedRefName.number);
    String? token = await MySharedPreferences.getStringData(key: SharedRefName.token);
    bool hasRequiredData = false;


    if(name.isEmpty || address.isEmpty || phoneNumber!.isEmpty){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddShippingAddressPage()));
      print("Order Didn't PLaced");

    }
    else{
      hasRequiredData = true;
      placeOrder(name, phoneNumber, "1", address, "32", "", "cash", token!);
    }
  }

  void placeOrder(String name, String number, String area, String address, String district, String note, String paymentTyp, String token) async{
    try{
      Response response = await post(
        Uri.parse("https://readyelectronics.com.bd/api/v1/customer/order/save"),
        body: {
          'fullName' : name,
          "phoneNumber": number,
          "area": area,
          "address": address,
          "district": district,
          "note": note,
          "paymentType": "payment"
        },
        headers: {
          "customer_id" : 123.toString(),
          "discount" : "123",
          "Authorization" : "Bearer ${token.toString()}"
        },
      );


      print("order response ${response.body}");
      if(response.statusCode==200){

        print("oder success");

        final data = jsonDecode(response.body);
        print("otp data $data");


      }
      else{
        print("Order Failed");
      }
    } catch(e,tr){
      print("order exceptions ${e.toString()}");
    }
  }

  void getUsersInfo() async {

    name = await MySharedPreferences.getStringData(key: SharedRefName.name)??"";
    phoneNumber = await MySharedPreferences.getStringData(key: SharedRefName.number)??"";
    address = await MySharedPreferences.getStringData(key: SharedRefName.address)??"";

  }
}

