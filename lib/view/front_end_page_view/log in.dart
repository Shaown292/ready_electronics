import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:testing_riverpod/components/progress%20bar.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/view/front_end_page_view/OTP%20Verification.dart';
import '../../components/colors.dart';
import '../../provider class/Data Class.dart';

class LogInOTP extends StatefulWidget {

  const LogInOTP({Key? key, required this.previousScreen}) : super(key: key);

  final String previousScreen;

  @override
  State<LogInOTP> createState() => _LogInOTPState();
}

class _LogInOTPState extends State<LogInOTP> {

  final phoneNumberController = TextEditingController();



  @override
  void initState() {
    phoneNumberController.text = "+880";
    super.initState();
  }
  void sentOpt(String phoneNumber) async{
    ProgressBar myProgressBar = ProgressBar();
    myProgressBar.showDialogue(widgetContext: context, message: "Please wait for the otp to send", type: SimpleFontelicoProgressDialogType.phoenix);
    try{
      Response response = await post(
        Uri.parse("https://readyelectronics.com.bd/api/v1/customer/login"),
        body: {
          'phone' : phoneNumber
      }
      );

      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        myProgressBar.hideDialogue();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  OTPVerification(
          phoneNumber: phoneNumberController.text.toString(),previousScreen: widget.previousScreen,
        )));
        print(data);
        print("account created");
      }
      else{
        print("Failed");
        myProgressBar.hideDialogue();
      }
    } catch(e){
      myProgressBar.hideDialogue();
      print((e).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(
            title: const RobotoText(text: 'Sign in', size: 16.0,color: custom, fontWeight: null,),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: custom),
          ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: RobotoText(text: "Login / Register to make order, access your orders, special offers and more!", size: null, fontWeight: null,),
              ),
              const SizedBox(height: 20.0),

              const RobotoText(text: "PHONE NUMBER", size: 18.0, fontWeight: FontWeight.bold, color: custom),
              TextField(
              controller: phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder:  const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )
                  )
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  RichText(text:  const TextSpan(
                      text: 'By continuing you agree to our ',
                      style:
                      TextStyle(
                        fontSize: 13.0,
                        color: Colors.black54,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Terms of services, Privacy Policy & Refund Policy',
                          style: TextStyle(fontSize: 15, color: custom),
                        )
                      ]
                  ))
                ],
              ),
              
              const SizedBox(height: 20.0,),

          //otp send button


          GestureDetector(
            onTap: () {
              sentOpt(phoneNumberController.text.toString());

              context.read<AddDetailsProvider>().addMobile(phoneNumberController.text.toString());

            },
            child: Center(
              child: Container(
                height: 50,
                width: 120,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: custom,
                ),

                child: Center(
                  child: Text('Send', style: GoogleFonts.roboto(
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
              
              const SizedBox(height: 20.0,),

            ],
          ),
        ),
      ),
    );
  }
}


