
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/pages/Category%20Pages/Breadboard%20&%20Wire.dart';
import 'package:testing_riverpod/pages/Category%20Pages/Power%20Supply.dart';
import 'package:testing_riverpod/pages/Category%20Pages/Tools%20&%20Accessories.dart';
import 'package:testing_riverpod/pages/Category%20Pages/UPS.dart';
import 'package:testing_riverpod/view/Brand%20View.dart';
import 'package:testing_riverpod/view/Features%20Product.dart';
import 'package:testing_riverpod/view/Front%20Category%20View.dart';
import 'package:testing_riverpod/view/Home%20Product.dart';
import 'package:testing_riverpod/view/Search%20Page.dart';
import 'package:testing_riverpod/view/SliderView.dart';
import 'package:testing_riverpod/view/demo.dart';
import '../Nav_Drawer.dart';
import '../components/CartButton.dart';
import '../components/colors.dart';
import '../components/component.dart';
import '../pages/Category Pages/Category Page1(Registor & Capasitor).dart';
import 'Flash Sell View.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var widthOfTheDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        toolbarOpacity: 0.75,
        iconTheme: const IconThemeData(color: custom),
        backgroundColor: Colors.white,
        title: Container(
          height: 80.0,
          width: 80.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/ready_logo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                Container(
                  //search bar
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 70,
                          height: 30.0,
                          child: GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "Search your product",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>  const SearchPage()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RobotoText(
                      text: "Category",
                      size: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                    RobotoText(
                      text: "View all",
                      size: 13.0,
                      fontWeight: FontWeight.w200,
                      color: custom,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0,),

                //Category

                SizedBox(
                  height: 90.0,
                  width: widthOfTheDevice,
                  child: const FrontCategoryView(),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                const FinalSlider(),
                const SizedBox(height: 20.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RobotoText(
                      text: "Flash Sell",
                      size: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                    RobotoText(
                      text: "View all",
                      size: 13.0,
                      fontWeight: FontWeight.w200,
                      color: custom,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const FlashSellView(),
                const SizedBox(height: 10.0),
                Container(
                  width: widthOfTheDevice,
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(
                      color: custom,
                      width: 1.0,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: custom,
                      ),
                      OpenSans(
                        text: "How to order from Ready Electronics?",
                        size: 13.0,
                        color: custom,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                const AddCard(
                  img: "assets/image/add2.jpg",
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RobotoText(
                      text: "Flash Sale",
                      size: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                    RobotoText(
                      text: "View all",
                      size: 13.0,
                      fontWeight: FontWeight.w200,
                      color: custom,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),



                //Listed item of the regular card

                const FeaturesProductView(),
                const SizedBox(
                  height: 10.0,
                ),
                const AddCard(
                  img: "assets/image/add.jpg",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const HomeProduct(),
                const SizedBox(
                  height: 20.0,
                ),
                const BrandView(),
                const SizedBox(
                  height: 50.0,
                ),
                // customSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
