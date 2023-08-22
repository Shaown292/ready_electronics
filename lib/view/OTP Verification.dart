import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_riverpod/view/HomePage.dart';
import '../Nav_Drawer.dart';
import '../components/colors.dart';
import '../components/component.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPVerification extends StatefulWidget {

  final String phoneNumber;

  const OTPVerification({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {


  void verifyOpt(String otp) async{
    try{
      Response response = await post(
          Uri.parse("https://readyelectronics.com.bd/api/v1/customer/verified"),
          body: {
            'verifyPin' : otp
          }
      );

      if(response.statusCode==200){

        print("account created");
        var preference = await SharedPreferences.getInstance();
        preference.setBool(NavDrawerState.KEYLOGIN, true);

      }
      else{
        print("Failed");
      }
    } catch(e){
      print((e).toString());
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
                }, // end onSubmit
              ),

              const SizedBox(height: 30.0),
              //otp send button

              // GestureDetector(
              //   onTap: (){
              //     verifyOpt();
              //     print(otpController);
              //
              //   },
              //   child: Center(
              //     child: Container(
              //       height: 50,
              //       width: 120,
              //       padding: const EdgeInsets.all(10.0),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.0),
              //         color: custom,
              //       ),
              //
              //       child: Center(
              //         child: Text('Verify', style: GoogleFonts.roboto(
              //           textStyle: const TextStyle(
              //             fontSize: 18.0,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),),
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(height: 20.0,),


            ],
          ),
        ),
      ),
    );
  }
}


