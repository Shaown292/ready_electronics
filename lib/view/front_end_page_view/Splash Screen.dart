

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_riverpod/view/front_end_page_view/HomePage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  }


class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 5000), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomePage(),));
    });

    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white,Colors.white70],
          begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300.0,
              width: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(
                  'assets/image/ready_logo.png'
                ),

                ),
              ),
            ),
            // Text("Ready", style: GoogleFonts.roboto(
            //   textStyle: const TextStyle(
            //     fontSize: 60.0,
            //     fontWeight: FontWeight.w600,
            //     color: Colors.black,
            //   )
            // ),
            // ),
            // Text("Electronics", style: GoogleFonts.notoSans(
            //     textStyle: const TextStyle(
            //       fontSize: 40.0,
            //       fontWeight: FontWeight.w500,
            //       color: Colors.black26,
            //     )
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
