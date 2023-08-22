import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/pages/Cart%20Data.dart';
import 'package:testing_riverpod/provider%20class/Data%20Class.dart';
import 'package:testing_riverpod/data/order%20data.dart';
import 'package:testing_riverpod/pages/AddShippingAddressPage.dart';
import 'package:testing_riverpod/pages/Checkout%20Page.dart';
import 'package:testing_riverpod/provider%20class/home%20Product%20provider.dart';
import 'package:testing_riverpod/view/Front%20Category%20View.dart';
import 'package:testing_riverpod/view/Search%20Page.dart';
import 'package:testing_riverpod/view/SliderView.dart';
import 'package:testing_riverpod/pages/ProfilePage.dart';
import 'package:testing_riverpod/view/Splash%20Screen.dart';
import 'package:testing_riverpod/pages/cart_page.dart';
import 'package:testing_riverpod/pages/order.dart';
import 'package:testing_riverpod/provider%20class/provider%20for%20form%20validation.dart';
import 'package:testing_riverpod/view/all%20product.dart';
import 'package:testing_riverpod/view/demo.dart';
import 'package:testing_riverpod/view/log%20in%20otp.dart';
import 'package:testing_riverpod/view/practice.dart';
import 'Model/Slider Model.dart';
import 'components/colors.dart';
import 'view/HomePage.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('cart_box');
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
        ChangeNotifierProvider(create: (context)=> CartProviderData()),
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
