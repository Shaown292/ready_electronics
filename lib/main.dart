import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/provider%20class/Data%20Class.dart';
import 'package:testing_riverpod/view/front_end_page_view/Splash%20Screen.dart';
import 'package:testing_riverpod/provider%20class/provider%20for%20form%20validation.dart';
import 'components/colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> FormProvider()),
        ChangeNotifierProvider(create:(context)=>CartProvider()),
        ChangeNotifierProvider(create: (context)=> AddDetailsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: custom,
        ),
        home:  const SplashScreen(),
      ),
    );
  }
}
