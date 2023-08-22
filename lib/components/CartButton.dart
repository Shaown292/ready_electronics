import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/provider%20class/Data%20Class.dart';
import 'package:testing_riverpod/pages/EmptyCard.dart';
import 'package:testing_riverpod/pages/cart_page.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (BuildContext context, value, Widget? child){
      return GestureDetector(
        onTap: () {
          if(value.getCounter() == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmptyCard()));
          }
          else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
          }

        },
        child:    Center(
          child:  Badge(
            label: RobotoText(text: value.getCounter(), size: 13.0, fontWeight: FontWeight.w500, color: Colors.white),
            backgroundColor: Colors.redAccent,
            child: const Icon(
              Icons.shopping_cart,
              color: custom,
              size: 32.0,
            ),
          ),
        ),
      );
    },

    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        context.read<CartProvider>().addCounter();
        const snackBar = SnackBar(
          content: Text('Your Product has been added'),
        );

        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
      },
      child: Container(
        height: 30.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: custom,
        ),
        child: const Center(child: RobotoText(text: "Add to cart", size: 14.0, fontWeight: FontWeight.normal, color: Colors.white,)),
      ),
    );
  }
}
