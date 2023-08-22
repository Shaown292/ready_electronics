import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/CartButton.dart';
import '../../components/colors.dart';
import '../../components/component.dart';

class ToolsAndAccessories extends StatelessWidget {
  const ToolsAndAccessories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryData> categoryDataList = [
      CategoryData(
        imagePath: "assets/image/kc1.jpg",
        productName: "KILOOHM (KΩ) 0.25W",
        price: "৳ 5",
        afterDiscount: "3",
      ),
      CategoryData(
        imagePath: "assets/image/kc2.jpg",
        productName: "1N4007 Rectifier Diode- 5",
        price: "৳ 15",
        afterDiscount: "10",
      ),
      CategoryData(
        imagePath: "assets/image/kc3.jpg",
        productName: "25Pcs 1M Ohm Carbon Film Resistor",
        price: "৳ 35",
        afterDiscount: "25",
      ),
      CategoryData(
        imagePath: "assets/image/kc4.jpg",
        productName: "USB Charge Current Detection",
        price: "৳ 150",
        afterDiscount: "30",
      ),
      CategoryData(
        imagePath: "assets/image/kc5.jpg",
        productName: "5W Ceramic Cement Power Resist..",
        price: "৳ 20",
        afterDiscount: "15",
      ),
      CategoryData(
        imagePath: "assets/image/kc6.jpg",
        productName: "0.5W Carbon Film Resistor 5%",
        price: "৳ 24",
        afterDiscount: "20",
      ),
      CategoryData(
        imagePath: "assets/image/kc6.jpg",
        productName: "0.5W Carbon Film Resistor 5%",
        price: "৳ 24",
        afterDiscount: "20",
      ),
      CategoryData(
        imagePath: "assets/image/kc6.jpg",
        productName: "0.5W Carbon Film Resistor 5%",
        price: "৳ 24",
        afterDiscount: "20",
      ),
      CategoryData(
        imagePath: "assets/image/kc6.jpg",
        productName: "0.5W Carbon Film Resistor 5%",
        price: "৳ 24",
        afterDiscount: "20",
      ),
      CategoryData(
        imagePath: "assets/image/kc6.jpg",
        productName: "0.5W Carbon Film Resistor 5%",
        price: "৳ 24",
        afterDiscount: "20",
      ),
      CategoryData(
        imagePath: "assets/image/kc6.jpg",
        productName: "0.5W Carbon Film Resistor 5%",
        price: "৳ 24",
        afterDiscount: "20",
      ),
      CategoryData(
        imagePath: "assets/image/kc6.jpg",
        productName: "0.5W Carbon Film Resistor 5%",
        price: "৳ 24",
        afterDiscount: "20",
      ),


      // add more images here...
    ];
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width-20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: RobotoText(
                      text: 'Tools and Accessories',
                      size: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),

                GridView.builder(
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categoryDataList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final categoryData = categoryDataList[index];
                      return GestureDetector(


                        child: CategoryCard(
                          img: categoryData.imagePath,
                          productName: categoryData.productName,
                          productValue: categoryData.price,
                          valueAfterDiscount: categoryData.afterDiscount,
                        ),
                      );
                    }),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CategoryData {
  final String imagePath;
  final String productName;
  final String price;
  final String afterDiscount;

  CategoryData({
    required this.imagePath,
    required this.productName,
    required this.price,

    required this.afterDiscount,
  });
}