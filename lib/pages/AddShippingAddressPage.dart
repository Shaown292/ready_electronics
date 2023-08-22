import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_riverpod/components/CartButton.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/components/text%20field.dart';
import 'package:testing_riverpod/provider%20class/provider%20for%20form%20validation.dart';

import '../Nav_Drawer.dart';
import '../components/colors.dart';
import '../provider class/Data Class.dart';
import '../view/log in otp.dart';
import 'ProfilePage.dart';

class AddShippingAddressPage extends StatefulWidget {
  const AddShippingAddressPage({Key? key}) : super(key: key);

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  // Initial Selected Value
  String dropDownValue = 'Dhaka';
  String name = "" ;
  String phoneNumber = "" ;
  String address = "";
  var userNameController = TextEditingController();



  final formKey = GlobalKey<FormState>();

  // List of items in our dropdown menu
  var City = [
    'Barisal',
    'Chattogram',
    'Dhaka',
    'Khulna',
    'Mymensingh',
    'Rajshahi',
    'Rangpur',
    'Sylhet',
  ];

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<FormProvider>(context);
    final info = Provider.of<AddDetailsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: const RobotoText(
          text: "Add Shipping Address",
          size: 13.0,
          color: custom,
          fontWeight: null,
        ),
        iconTheme: const IconThemeData(color: custom),
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding:   const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: (){
                   userLoggedIn();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Icon(Icons.edit_document, size: 24.0, color: Colors.black,),
                        SizedBox(width: 5.0,),
                        RobotoText(text: "Edit", size: 18.0, fontWeight: FontWeight.w500, color: Colors.black,),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RobotoText(
                        text: "Name", size: 16.0, fontWeight: FontWeight.w300),
                    const SizedBox(width: 30.0,),
                    Expanded(
                      child: Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10.0,),
                            RobotoText(
                              text: info.getName(),
                              size: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RobotoText(
                        text: "Mobile", size: 16.0, fontWeight: FontWeight.w300),
                    const SizedBox(width: 22.0,),
                    Expanded(
                      child: Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10.0,),
                            RobotoText(
                              text: "",
                              size: 18.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RobotoText(
                        text: "Address", size: 16.0, fontWeight: FontWeight.w300),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10.0,),
                            Flexible(
                              child: Text(
                                info.address,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RobotoText(
                        text: "City", size: 16.0, fontWeight: FontWeight.w300),
                    SizedBox(
                      width: 300.0,
                      child: DropdownButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        // Initial Value
                        value: dropDownValue,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: City.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void userLoggedIn() {
    if(NavDrawerState.KEYLOGIN == true){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LogInOTP()));
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

