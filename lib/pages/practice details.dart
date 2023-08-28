import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/Model/favorite%20item%20model.dart';

import '../cart/screen/CartButton.dart';
import '../components/colors.dart';
import '../components/component.dart';
import '../provider class/Data Class.dart';
import '../view/practice.dart';

class PracticeFavorite extends StatefulWidget {
  const PracticeFavorite({Key? key}) : super(key: key);

  @override
  State<PracticeFavorite> createState() => _PracticeFavoriteState();
}

class _PracticeFavoriteState extends State<PracticeFavorite> {

  @override
  Widget build(BuildContext context) {
     List<FavItem> items = [];
    final favoriteItem = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.75,
        iconTheme: const IconThemeData(color: custom),
        backgroundColor: Colors.white,
        title: Container(
          height: 80.0,
          width: 80.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/ready_logo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5000,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Consumer<CartProvider>(builder: (context, value, child){
                        return ListTile(
                          onTap: (){
                            if(value.selectedItems.contains(index)){
                              value.removeItems(index);
                            }
                            else{
                              value.addItems(index);
                            }
                          },
                          title: Text(items[index].productName.toString()),
                          trailing: Icon(value.selectedItems.contains(index)? Icons.favorite: Icons.favorite_outline),
                        );
                      });
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10.0,
                      );
                    },
                    itemCount: items.length),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
