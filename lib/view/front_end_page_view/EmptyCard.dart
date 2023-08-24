import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/view/front_end_page_view/HomePage.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Colors.white
              ),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
                      },
                        child: const Icon(Icons.arrow_back, color: custom, size: 24.0,)),
                  ],
                ),
              ),

              ),

            const SizedBox(height: 50.0,),
            const RobotoText(text: "Your Cart is Empty", size: 32.0, fontWeight: FontWeight.w200, color: Colors.grey),
            const SizedBox(height: 30.0,),
            const Center(child: Icon(Icons.shopping_cart_outlined, color: Colors.grey,size: 100.0,)),
          ],
        ),
      ),
    );
  }
}
