import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/components/snack_bar.dart';
import 'package:testing_riverpod/view/front_end_page_view/edit_profile_page.dart';
import 'package:testing_riverpod/provider%20class/Data%20Class.dart';

import '../../constants/share_preference_name.dart';
import '../../preferences.dart';
import '../home_page_features/Nav_Drawer.dart';
import '../../components/CartButton.dart';
import '../../components/colors.dart';
import '../../components/component.dart';
import 'log in.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();


  @override
  void initState() {
   getUsersInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const RobotoText(
          text: "My Account",
          size: 24.0,
          fontWeight: FontWeight.bold,
          color: custom,
        ),
        iconTheme: const IconThemeData(
          color: custom,
        ),
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
          padding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Stack(children: [
                  CircleAvatar(
                    radius: 48.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/image/profile.png'),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.cloud_upload,
                      color: custom,
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(
                  thickness: 2.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),

                GestureDetector(
                  onTap: () {
                    userLoggedIn();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.edit_document,
                          size: 30.0,
                          color: custom,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RobotoText(
                          text: "Edit",
                          size: 24.0,
                          fontWeight: FontWeight.w500,
                          color: custom,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(
                      width: 45.0,
                    ),
                    Expanded(
                      child:TextField(
                        readOnly: true,
                        controller: nameController,
                        decoration: InputDecoration(
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
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.email,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "E-mail",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: emailController,
                        decoration: InputDecoration(
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
                          hintText: "example@gmail.com",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.location_on,
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
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: addressController,
                        decoration: InputDecoration(
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
                          hintText: "Address",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Icon(
                          Icons.call,
                          color: custom,
                          size: 24.0,
                        ),
                        RobotoText(
                          text: "Number",
                          size: 18.0,
                          fontWeight: null,
                          color: custom,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: phoneController,
                        decoration: InputDecoration(
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
                          hintText: "+880178....",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
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
      CustomSnackBar(context: context, text: "You need to log in first");

    }
  }

  void getUsersInfo() async {

    nameController.text = await MySharedPreferences.getStringData(key: SharedRefName.name)??"";
    phoneController.text = await MySharedPreferences.getStringData(key: SharedRefName.number)??"";
    addressController.text = await MySharedPreferences.getStringData(key: SharedRefName.address)??"";
    emailController.text = await MySharedPreferences.getStringData(key: SharedRefName.email)??"";

  }
}
