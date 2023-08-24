import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';


import 'package:testing_riverpod/components/CartButton.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/components/snack_bar.dart';
import 'package:testing_riverpod/constants/static_variable.dart';
import 'package:testing_riverpod/view/front_end_page_view/Checkout%20Page.dart';


import '../../components/custom_text_field.dart';
import '../../constants/share_preference_name.dart';
import '../../preferences.dart';

import '../../components/colors.dart';

import 'log in.dart';
import 'edit_profile_page.dart';

class AddShippingAddressPage extends StatefulWidget {
  const AddShippingAddressPage({Key? key}) : super(key: key);

  @override
  State<AddShippingAddressPage> createState() => _AddShippingAddressPageState();
}

class _AddShippingAddressPageState extends State<AddShippingAddressPage> {
  // Initial Selected Value


  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();

  String dropDownValue = 'Dhaka';

  @override
  void initState() {
    getUsersInfo();
    super.initState();
  }
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
                const SizedBox(height: 20.0,),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "Name",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    const SizedBox(width: 30.0,),
                    Expanded(
                      child: CustomTextField(
                        hintText: "Mr. Example",
                        readOnly: false,
                        controller: nameController,
                      )
                    ),

                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.call,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "Mobile",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    const SizedBox(width: 22.0,),
                    Expanded(
                      child: CustomTextField(
                        controller: phoneController,
                        hintText: "+880178....",
                        readOnly: true,
                        icon: const Icon(Icons.lock),
                      )
                    ),

                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "Address",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: CustomTextField(
                          hintText: 'Your Address here',
                          readOnly: false,
                          controller: addressController),
                    ),

                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "City",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    const SizedBox(width: 45.0,),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        // Initial Value
                        decoration:  InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
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
                const SizedBox(height: 40.0),
                Center(
                  child: Container(
                    height: 50,
                    width: 120,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: custom,
                    ),

                    child: GestureDetector(
                      onTap: () {
                        MySharedPreferences.setStringData(key: SharedRefName.name, data: nameController.text.toString());
                        MySharedPreferences.setStringData(key: SharedRefName.address, data: addressController.text.toString());

                        StaticVariables.name = nameController.text;
                        StaticVariables.address = addressController.text;

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutPage()));
                      },
                      child: Center(
                        child: Text('Save', style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void userLoggedIn() async{

    var isLogIn =await MySharedPreferences.getBoolData(key: SharedRefName.isLoggedIn);


    if (isLogIn == true) {

      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
    }

    else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInOTP()));

      CustomSnackBar(context: context, text: "You need to Log in first");

    }
  }

  void getUsersInfo() async {

    nameController.text = await MySharedPreferences.getStringData(key: SharedRefName.name)??"";
    phoneController.text = await MySharedPreferences.getStringData(key: SharedRefName.number)??"";
    addressController.text = await MySharedPreferences.getStringData(key: SharedRefName.address)??"";

  }




}

