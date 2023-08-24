
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/view/front_end_page_view/order.dart';

import '../components/component.dart';

class MyOrderList extends StatelessWidget {
   const MyOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <OrderList> orderList = [
      OrderList(id: "1", date: "24.01.2023", totalPrice: "35000", status: "Delivered",),
      OrderList(id: "2", date: "02.02.2023", totalPrice: "140", status: "Delivered", ),
      OrderList(id: "3", date: "19.06.2023", totalPrice: "1350", status: "Pending", ),
      OrderList(id: "4", date: "22.07.2023", totalPrice: "6700", status: "Pending",),
      OrderList(id: "5", date: "24.07.2023", totalPrice: "310", status: "Pending",),
      OrderList(id: "1", date: "24.01.2023", totalPrice: "35000", status: "Delivered", ),
      OrderList(id: "2", date: "02.02.2023", totalPrice: "140", status: "Delivered", ),
      OrderList(id: "3", date: "19.06.2023", totalPrice: "1350", status: "Pending", ),
      OrderList(id: "4", date: "22.07.2023", totalPrice: "6700", status: "Pending",),
      OrderList(id: "5", date: "24.07.2023", totalPrice: "310", status: "Pending"),
    ];
    return
       ListView.builder(itemBuilder: (BuildContext context, int index){
         return MyOrder(
           orderList: orderList[index],
         );
       },
         itemCount: orderList.length,
       );
  }
}

class OrderList {
  final String id;
  final String date;
  final String totalPrice;
  final String status;

  OrderList({required this.id, required this.date, required this.totalPrice, required this.status});
  
}
