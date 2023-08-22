import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _items = [];
  final _shoppingBox = Hive.box('cart_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final item = _shoppingBox.get(key) as Map<String, dynamic>;
      return {
        "key": key,
        "price": item["price"],
        "name": item["name"],
        "oldPrice": item["oldPrice"],
        "image": item["image"],
        "id": item["id"],
      };
    }).toList();
    setState(() {
      _items = data.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: _items.isNotEmpty
          ? ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return ListTile(
            title: Text(item["name"]),
            subtitle: Text(item["price"].toString()),
          );
        },
      )
          : Center(
        child: Text('No cart items available.'),
      ),
    );
  }
}