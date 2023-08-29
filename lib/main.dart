import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/provider%20class/Data%20Class.dart';
import 'package:testing_riverpod/view/front_end_page_view/AddShippingAddressPage.dart';
import 'package:testing_riverpod/cart/screen/Checkout%20Page.dart';
import 'package:testing_riverpod/provider%20class/home%20Product%20provider.dart';
import 'package:testing_riverpod/view/home_page_features/Front%20Category%20View.dart';
import 'package:testing_riverpod/view/front_end_page_view/Search%20Page.dart';
import 'package:testing_riverpod/view/home_page_features/SliderView.dart';
import 'package:testing_riverpod/view/front_end_page_view/edit_profile_page.dart';
import 'package:testing_riverpod/view/front_end_page_view/Splash%20Screen.dart';
import 'package:testing_riverpod/cart/screen/cart_page.dart';
import 'package:testing_riverpod/provider%20class/provider%20for%20form%20validation.dart';
import 'package:testing_riverpod/view/home_page_features/all%20product.dart';
import 'package:testing_riverpod/view/practice.dart';
import 'Model/Slider Model.dart';
import 'components/colors.dart';
import 'view/front_end_page_view/HomePage.dart';

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
        ChangeNotifierProvider(create: (context)=> HomeProductProvider()),

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
