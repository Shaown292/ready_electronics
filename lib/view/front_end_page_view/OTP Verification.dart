import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testing_riverpod/cart/screen/cart_page.dart';
import 'package:testing_riverpod/view/front_end_page_view/AddShippingAddressPage.dart';
import 'package:testing_riverpod/view/front_end_page_view/HomePage.dart';
import 'package:testing_riverpod/view/front_end_page_view/edit_profile_page.dart';
import '../../constants/share_preference_name.dart';
import '../../preferences.dart';
import '../../components/colors.dart';
import '../../components/component.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPVerification extends StatefulWidget {

  const OTPVerification({Key? key, required this.phoneNumber, required this.previousScreen}) : super(key: key);

  final String phoneNumber;
  final String previousScreen;

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {


  void verifyOpt(String otp1) async{
    try{
      Response response = await post(
          Uri.parse("https://readyelectronics.com.bd/api/v1/customer/verified"),
          body: {
            'verifyPin' : otp1
          },
          headers: {"verifyphone":widget.phoneNumber},
      );


      print("verification response ${response.body}");
      if(response.statusCode==200){

        print("Verification success");

        final data = jsonDecode(response.body);
        print("otp data $data");
        String myToken = data["token"];
        String myOtp = otp1;
        print("token: $myToken");
        MySharedPreferences.setStringData(key: SharedRefName.token, data: myToken);

        MySharedPreferences.setBoolData(key: SharedRefName.isLoggedIn, data: true);

        MySharedPreferences.setStringData(key: SharedRefName.number, data: widget.phoneNumber);

        MySharedPreferences.setStringData(key: SharedRefName.otp, data: myOtp);

        navigateTo();

      }
      else{
        print("Verification Failed");
      }
    } catch(e,tr){
      print("otp verification exceptions ${e.toString()}");
    }
  }

  void navigateTo(){
    switch(widget.previousScreen){
      case "homeScreen" : // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
      Navigator.pop(context);
      break;
      case "cartScreen" : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const CartPage()));
      break;
      case "addShippingAddressScreen" : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AddShippingAddressPage()));
      break;
      case "editProfileScreen" : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const EditProfilePage()));
      break;

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const RobotoText(text: 'Verification', size: 16.0,color: custom, fontWeight: null,),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: custom),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),

                const RobotoText(text: "Enter verification code that has been sent to", size: null, fontWeight: null,),
              const SizedBox(height: 5.0,),
              RobotoText(text: widget.phoneNumber, size: null, fontWeight: null,),

              const SizedBox(height: 20.0),

              OtpTextField(
                numberOfFields: 4,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) async{
                  verifyOpt(verificationCode);
                  print(verificationCode);

                }, // end onSubmit
              ),

              const SizedBox(height: 30.0),

            ],
          ),
        ),
      ),
    );
  }
}


