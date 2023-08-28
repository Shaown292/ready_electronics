import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/cart/controller/cart_controller.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:testing_riverpod/components/component.dart';

import 'package:testing_riverpod/cart/screen/cart_page.dart';


class CustomCart extends StatefulWidget {
  const CustomCart({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  @override
  Widget build(BuildContext context) {


    return GetBuilder<CartController>(
        init: CartController(),
        builder: (counter){
          if(counter.cartDataDisplayModel  == null || counter.cartDataDisplayModel!.cartData!.isEmpty){
            return GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child:    Center(
                child:  Badge(
                  label: RobotoText(text:"0", size: 13.0, fontWeight: FontWeight.w500, color: Colors.white),
                  backgroundColor: Colors.redAccent,
                  child: const Icon(
                    Icons.shopping_cart,
                    color: custom,
                    size: 32.0,
                  ),
                ),
              ),
            );


          }
          return GestureDetector(
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            },
            child: Center(
              child:  Badge(
                label: RobotoText(text:(counter.cartDataDisplayModel!.cartData!.length), size: 13.0, fontWeight: FontWeight.w500, color: Colors.white),
                backgroundColor: Colors.redAccent,
                child: const Icon(
                  Icons.shopping_cart,
                  color: custom,
                  size: 32.0,
                ),
              ),
            ),
          );
        }
    );


  }
}

