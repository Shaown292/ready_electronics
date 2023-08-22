import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/component.dart';

class CategoryPageData1 extends StatelessWidget {
  const CategoryPageData1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<ImageData> imageDataList = [
      ImageData(
        imagePath: "assets/image/category1.jpg",
        productName: "Registor,\n" "Capasitor",
        productPrice: "৳ 5",
        priceAfterDiscount: "৳ 3"
      ),
      ImageData(
          imagePath: "assets/image/category1.jpg",
          productName: "Registor,\n" "Capasitor",
          productPrice: "৳ 5",
          priceAfterDiscount: "৳ 3"
      ),
      ImageData(
          imagePath: "assets/image/category1.jpg",
          productName: "Registor,\n" "Capasitor",
          productPrice: "৳ 5",
          priceAfterDiscount: "৳ 3"
      ),
      // add more images here...
    ];
    return  SizedBox(
      height: 200.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final imageData = imageDataList[index];
          return RegularCard(
            img: imageData.imagePath,
            productName: imageData.productName,
            productValue: imageData.productPrice,
            valueAfterDiscount: imageData.productPrice,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10.0);
        },
        itemCount: imageDataList.length,
      ),
    );
  }
}


class ImageData {
  final String imagePath;
  final String productName;
  final String productPrice;
  final String priceAfterDiscount;


  ImageData({
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.priceAfterDiscount,
  });
}

