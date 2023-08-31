
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:testing_riverpod/components/popup_dialogue.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cart/screen/EmptyCard.dart';
import '../provider class/Data Class.dart';


class OpenSans extends StatelessWidget {
  final text;
  final color;
  final size;
  final fontWeight;

  const OpenSans(
      {Key? key,
      required this.text,
      this.color,
      required this.size,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: GoogleFonts.openSans(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  final img;
  const AddCard({
    Key? key,
    @required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width - 20.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BuildSmallCard extends StatelessWidget {
  final String productName;
  final String img;
  const BuildSmallCard({
    Key? key,
    required this.productName,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthOfTheDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      width: (widthOfTheDevice / 5) - 14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 2.0),
          SizedBox(
            height: 33.0,
            child: Center(
              child: Text(
                productName,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          // image: AssetImage("assets/image/11.jpg"),
          // fit: BoxFit.cover,
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final img;
  final productName;
  final productValue;
  final valueAfterDiscount;
  const CategoryCard(
      {Key? key,
      @required this.img,
      @required this.productName,
      @required this.productValue,
      this.valueAfterDiscount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      elevation: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.contain,
                  ),
                ),
                height: 80.0,
                width: 80.0,
              ),
            ),
          ),
          const SizedBox(height: 5.0,),

          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              productName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(height: 5.0,),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  productValue,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    "৳ $valueAfterDiscount",
                    style: GoogleFonts.roboto(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class RegularCard extends StatelessWidget {
  final String  img;
  final String  productName;
  final String  productValue;
  final String  valueAfterDiscount;
  const RegularCard(
      {Key? key,
      required this.img,
      required this.productName,
      required this.productValue,
      required this.valueAfterDiscount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthOfTheDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthOfTheDevice / 3.0 - 10.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.contain,
                    ),
                  ),
                  height: 120.0,
                  width: 120.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "৳ $productValue",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(width: 5.0),

                  Text(
                    "৳ $valueAfterDiscount",
                    style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}





class RobotoText extends StatelessWidget {
  final text;
  final color;
  final size;
  final fontWeight;
  const RobotoText(
      {Key? key,
      @required this.text,
      this.color,
      @required this.size,
      @required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: GoogleFonts.openSans(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Row(children: [
            Icon(Icons.handshake_outlined),
            SizedBox(
              width: 10.0,
            ),
            RobotoText(
              text: "Cash On Delivery",
              size: 24.0,
              fontWeight: FontWeight.bold,
              color: custom,
            ),
          ]),
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: Container(
            height: 100.0,
            width: 50.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/image/pay.jpeg"),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            )),
          ),
          value: SingingCharacter.jefferson,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            PopupDialogue.show(context: context, header: "Online Payment Method", body: "Online payment is not available at this moment", footer: "close", onTap: ()=> Navigator.pop(context) );
            setState(() {
              _character = null;
            });
          },
        ),
      ],
    );
  }
}

class ProfilePicker extends StatefulWidget {
  const ProfilePicker({Key? key}) : super(key: key);

  @override
  State<ProfilePicker> createState() => _ProfilePickerState();
}

class _ProfilePickerState extends State<ProfilePicker> {
  File? imageFile;

  /// Get from gallery
  Future _getFromGallery() async {
    final returnPhoto = (await ImagePicker().pickImage(
      source: ImageSource.gallery,
    ));
    setState(() {
      imageFile = File(returnPhoto!.path);
    });
    imageFile != null
        ? Image.file(imageFile!)
        : const Text('Please select an image');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: imageFile == null
          ? Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: const Stack(children: [
                    CircleAvatar(
                      radius: 48.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/image/11.jpg'),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Icon(
                        Icons.cloud_upload,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ]),
                ),
              ],
            )
          : GestureDetector(
              onTap: () {
                _getFromGallery();
              },
              child: Stack(children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.file(imageFile!),
                ),
                const Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Icon(
                    Icons.cloud_upload,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ]),
            ),
    );
  }
}


class Messenger extends StatelessWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
       // var url = 'fb://facewebmodal/f?href=https://www.facebook.com/readyelectronics/';
        var url = 'http://m.me/2599541833404449';
        if (await canLaunch(url)) {
        await launch( url, universalLinksOnly: true, );
        } else { throw 'There was a problem to open the url: $url'; }
      },
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/image/messenger.png'),
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}

class CartItems extends StatefulWidget {
  final String image;
  final String productName;
  final String details;
  final String oldPrice;
  final String newPrice;
  const CartItems({Key? key, required this.image, required this.productName, required this.details, required this.oldPrice, required this.newPrice}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  void _show() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Your Product has been added to the cart yay!!!"),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 80.0,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                    height: 70.0,
                    width: 70.0,
                  ),
                  const SizedBox(width: 20.0),
                  SizedBox(
                    width: 120.0,
                    child: Text(
                      widget.productName,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CartProvider>()
                                  .removeCounter();
                              _show();
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const EmptyCard()));
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.oldPrice,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  decoration: TextDecoration
                                      .lineThrough,
                                  fontSize: 11.0,
                                  color: Colors.black,
                                  fontWeight:
                                  FontWeight.w200),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RobotoText(
                            text: widget.newPrice,
                            size: 12.0,
                            fontWeight: FontWeight.normal,
                            color: custom,
                          ),
                        ],
                      ),
                      Container(
                        height: 20.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Consumer<CartProvider>(
                            builder: (context, data, child) {
                              return Center(
                                child: Text(
                                  '${data.counter}',
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ItemCart extends StatefulWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, Widget? child){
        return Card(
          elevation: 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(context.read<CartProvider>().getImage()),
                      fit: BoxFit.contain,
                    ),
                  ),
                  height: 70.0,
                  width: 70.0,
                ),
                const SizedBox(width: 20.0),
                SizedBox(
                  width: 120.0,
                  child: Text(
                    value.getProductName(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40.0,
                ),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartProvider>()
                                .emptyingCart();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const EmptyCard()));
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          context.read<CartProvider>().oldPrice.toString(),
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                decoration: TextDecoration
                                    .lineThrough,
                                fontSize: 11.0,
                                color: Colors.black,
                                fontWeight:
                                FontWeight.w200),
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        RobotoText(
                          text: context.read<CartProvider>().totalPrice.toString(),
                          size: 12.0,
                          fontWeight: FontWeight.normal,
                          color: custom,
                        ),
                      ],
                    ),
                    Container(
                      height: 20.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight:
                              FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}











