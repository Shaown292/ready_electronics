import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/data/order%20data.dart';

import '../../components/CartButton.dart';
import '../../components/colors.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: custom),
        title: const RobotoText(text: "My Orders", size: 24.0, fontWeight: FontWeight.bold, color: custom),
        backgroundColor: Colors.white,
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: const MyOrderList(),
    );
  }
}
