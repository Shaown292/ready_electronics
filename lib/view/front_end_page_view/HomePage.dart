
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/cart/controller/cart_controller.dart';
import 'package:testing_riverpod/data/local%20data/favorite%20data.dart';
import 'package:testing_riverpod/display%20order/display_order_controller.dart';
import 'package:testing_riverpod/dropdown/controller/dropdown_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../all home features/controller/brand controller/brand controller.dart';
import '../../all home features/controller/features product controller/features_product_controller.dart';
import '../../all home features/controller/flash sell controller/flash_sell_controller.dart';
import '../../all home features/controller/front category controller/front_category_controller.dart';
import '../../all home features/controller/home_product_controller/all_product_controller.dart';
import '../../all home features/controller/slider_controller/slider_controller.dart';
import '../../all home features/screens/Brand View.dart';
import '../../all home features/screens/Features Product.dart';
import '../../all home features/screens/Flash Sell View.dart';
import '../../all home features/screens/front category view/Front Category View.dart';
import '../../all home features/screens/Nav_Drawer.dart';
import '../../all home features/screens/SliderView.dart';
import '../../all home features/screens/home_product.dart';
import '../../cart/screen/CartButton.dart';
import '../../components/colors.dart';
import '../../components/component.dart';
import '../../data/local data/cart_data_controller.dart';
import '../../search/screen/Search Page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CartDataController cartDataController = Get.put(CartDataController());
  FavoriteDataController favoriteDataController =  Get.put(FavoriteDataController());
  FlashSellController flashSellController = Get.put(FlashSellController());
  CartController cartController = Get.put(CartController());
  DropdownController dropdownController = Get.put(DropdownController());
  DisplayOrderController displayOrderController = Get.put(DisplayOrderController());
  SliderController sliderController = Get.put(SliderController());
  HomeProductController homeProductController = Get.put(HomeProductController());
  FeaturesProductController featuresProductController = Get.put(FeaturesProductController());
  FrontCategoryController frontCategoryController = Get.put(FrontCategoryController());
  BrandController brandController = Get.put(BrandController());

  @override
  void initState() {
    cartController.fetchCartProducts();
   cartDataController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthOfTheDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: Container(
          height: 100.0,
          width: 100.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/ready_logo.png"),
              fit: BoxFit.contain
            )
          ),
        ),
        iconTheme: const IconThemeData(color: custom),
        backgroundColor: Colors.white,
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
                          height: 35.0,
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
                  ],
                ),
                const SizedBox(height: 10.0,),

                //Category

                SizedBox(
                  height: 95.0,
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
                  ],
                ),
                const SizedBox(height: 10.0),
                const FlashSellView(),
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () async {
                      var url = 'https://www.youtube.com/watch?v=O1tsugTLdPs';
                      if (await canLaunch(url)) {
                        await launch( url, universalLinksOnly: true, );
                      } else { throw 'There was a problem to open the url: $url'; }

                  },
                  child: Container(
                    width: widthOfTheDevice,
                    height: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      border: Border.all(
                        color: custom,
                        width: 1.0,
                      ),
                    ),
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(
                            Icons.play_arrow,
                            color: custom,
                          ),

                        RobotoText(
                          text: "How to order from Ready Electronics?",
                          size: 13.0,
                          color: custom,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                const AddCard(
                  img: "assets/image/add2.jpg",
                ),
                const SizedBox(height: 20.0,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RobotoText(
                      text: "Featured Product",
                      size: 13.0,
                      fontWeight: FontWeight.w500,
                    ),

                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

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
