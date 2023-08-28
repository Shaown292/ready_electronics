import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';


import 'package:testing_riverpod/cart/screen/CartButton.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/components/snack_bar.dart';
import 'package:testing_riverpod/constants/static_variable.dart';
import 'package:testing_riverpod/cart/screen/Checkout%20Page.dart';
import 'package:testing_riverpod/dropdown/widget/area_dropdown_widget.dart';
import 'package:testing_riverpod/dropdown/widget/districts_dropdown_widget.dart';


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
   TextEditingController phoneController = TextEditingController();
   TextEditingController nameController = TextEditingController();
   TextEditingController addressController = TextEditingController();


  @override
  void initState() {
    getUsersInfo();
    super.initState();
  }

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

                //districts
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

                //areas
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "Districts",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    SizedBox(width: 12.0,),

                    Expanded(
                      // fit: FlexFit.loose,
                        child: DistrictsDropdownWidget()
                    )

                  ],
                ),

                const SizedBox(height: 10.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "Areas",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    SizedBox(width: 35.0,),
                    Expanded(
                      child: AreaDropdownWidget(),
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

                        String name = nameController.text;
                        String address = addressController.text;
                        MySharedPreferences.setStringData(key: SharedRefName.name, data: name);
                        MySharedPreferences.setStringData(key:SharedRefName.address, data: address);

                        userLoggedIn();
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

      Navigator.pop(context);
    }

    else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInOTP(previousScreen:  "addShippingAddressScreen",)));

      CustomSnackBar(context: context, text: "You need to Log in first");

    }
  }

  void getUsersInfo() async {

    nameController.text = await MySharedPreferences.getStringData(key: SharedRefName.name)??"";
    phoneController.text = await MySharedPreferences.getStringData(key: SharedRefName.number)??"";
    addressController.text = await MySharedPreferences.getStringData(key: SharedRefName.address)??"";

  }




}

