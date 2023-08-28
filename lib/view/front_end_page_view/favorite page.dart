import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/cart/screen/CartButton.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/view/practice.dart';

import '../../components/colors.dart';
import '../../Model/favorite item model.dart';
import '../../data/local data/favorite data.dart';
import '../../provider class/Data Class.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
  FavoriteDataController favoriteDataController = Get.find();
  @override
  Widget build(BuildContext context) {
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
      body: GetBuilder(
        init: FavoriteDataController(),
        builder: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var product = data.favData[index].values.toList();
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Card(
                            elevation: 0.5,
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
                              trailing: GestureDetector(
                                onTap: (){
                                  data.removeFavData(index);
                                },
                                  child: const Icon(
                                Icons.delete,
                                size: 25.0,
                                color: custom,
                              )),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10.0,
                        );
                      },
                      itemCount: data.favData.length),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
