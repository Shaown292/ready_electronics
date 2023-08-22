import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/components/CartButton.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/view/practice.dart';

import '../components/colors.dart';
import '../data/favorite item model.dart';
import '../pages/local data/favorite data.dart';
import '../provider class/Data Class.dart';
import '../provider class/home Product provider.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  // final List<FavItem> favItemList = [
  //   FavItem(
  //     image: "assets/image/ready_product6.jpg",
  //     productName:
  //     "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
  //     price: "680",
  //     priceAfterDiscount: "400",
  //   ),
  //   FavItem(
  //     image: "assets/image/ready_product6.jpg",
  //     productName:
  //     "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
  //     price: "680",
  //     priceAfterDiscount: "400",
  //   ),
  //   FavItem(
  //     image: "assets/image/ready_product6.jpg",
  //     productName:
  //     "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
  //     price: "680",
  //     priceAfterDiscount: "400",
  //   ),
  //   FavItem(
  //     image: "assets/image/ready_product6.jpg",
  //     productName:
  //     "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
  //     price: "680",
  //     priceAfterDiscount: "400",
  //   ),
  //   FavItem(
  //     image: "assets/image/ready_product6.jpg",
  //     productName:
  //     "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
  //     price: "680",
  //     priceAfterDiscount: "400",
  //   ),
  //   FavItem(
  //     image: "assets/image/ready_product6.jpg",
  //     productName:
  //     "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
  //     price: "680",
  //     priceAfterDiscount: "400",
  //   ),
  //   FavItem(
  //     image: "assets/image/ready_product6.jpg",
  //     productName:
  //     "3 In 1 Battery Tester Voltage Current Detector Mobile Power Voltage Current Meter USB Charger Doctor Single Output",
  //     price: "680",
  //     priceAfterDiscount: "400",
  //   )
  //
  // ];

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: custom),
        title: const RobotoText(
          text: "My Favorite",
          size: 24.0,
          fontWeight: FontWeight.w300,
          color: custom,
        ),
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: FavoriteData.instance.getFavData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40.0,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          var product = snapshot.data![index].values.toList();
                          return Card(
                            elevation: 0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(product[3]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width: 70.0,
                                ),
                                title: Text(
                                  product[1].toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      product[2].toString(),
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    RobotoText(
                                      text: product[0].toString(),
                                      size: 15.0,
                                      fontWeight: FontWeight.normal,
                                      color: custom,
                                    ),
                                  ],
                                ),
                                trailing: const Icon(Icons.delete, size: 25.0,color: custom,),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10.0,
                          );
                        },
                        itemCount: snapshot.data!.length),
                  ),
                ],
              ),
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}
