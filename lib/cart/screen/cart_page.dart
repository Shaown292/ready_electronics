
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_riverpod/cart/controller/cart_controller.dart';
import 'package:testing_riverpod/cart/model/cart_data_display_model.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/cart/screen/Checkout%20Page.dart';
import 'CartButton.dart';
import '../../components/colors.dart';
import '../../components/snack_bar.dart';
import '../../constants/share_preference_name.dart';
import '../../data/local data/cart_data_controller.dart';
import '../../preferences.dart';
import '../../view/front_end_page_view/log in.dart';

class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  CartDataController cartDataController = Get.find();
  CartController cartController = Get.find();
  String totalAmountToPay = "";

  @override
  void initState() {
   cartDataController.displayCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RobotoText(
          text: "Cart",
          size: 20.0,
          fontWeight: FontWeight.bold,
          color: custom,
        ),
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: custom),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 360.0,
                  child: GetBuilder<CartController>(
                      init: CartController(),
                      builder: (data) {

                        if(data.isError){
                          return  Center(child: Text(data.errorMessage.toString()),);
                        }
                        else if(data.cartDataDisplayModel== null){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        else if(data.cartDataDisplayModel!.cartData!.isEmpty){
                          return const Center(child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RobotoText(text: "Your Cart is Empty", size: 32.0, fontWeight: FontWeight.w200, color: Colors.grey),
                              SizedBox(height: 30.0,),
                              Center(child: Icon(Icons.shopping_cart_outlined, color: Colors.grey,size: 100.0,)),
                            ],
                          ),);
                        }

                        return ListView.builder(
                            itemCount: data.cartDataDisplayModel?.cartData?.length,
                            itemBuilder: (context, index) {

                              Product? product = data.cartDataDisplayModel?.cartData?[index].product;
                              
                              CartData cartData = data.cartDataDisplayModel!.cartData![index];


                              return Card(
                                elevation: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 80.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://readyelectronics.com.bd/${product!.image?.image.toString()}"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0,),
                                      Flexible(

                                        child: Column(
                                          children: [
                                            Text(
                                              product.proName.toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),

                                            Row(
                                              children: [
                                                Text(
                                                  product.proOldprice.toString(),
                                                  style: GoogleFonts.roboto(
                                                    textStyle: const TextStyle(
                                                        decoration:
                                                        TextDecoration.lineThrough,
                                                        fontSize: 14.0,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w200),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5.0,
                                                ),
                                                RobotoText(
                                                  text: product.proNewprice.toString(),
                                                  size: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                  color: custom,
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(onPressed: ()=> data.productDelete(productId: cartData.productId.toString()), icon: Icon(Icons.delete, color: custom, size: 25.0,)),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(onPressed: (){

                                                if(int.parse(cartData.quantity.toString()) > 1){
                                                  data.productQuantityDecrement(productId: cartData.productId.toString());
                                                }

                                              } , icon: const Icon(Icons.remove, color: Colors.red, size: 16.0,)),

                                              Container(
                                                width: 30.0,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(color: Colors.grey),
                                                ),
                                                child: Center(child: Text(cartData.quantity.toString())),
                                              ),

                                              IconButton(onPressed: ()=> data.productQuantityIncrement(productId: cartData.productId.toString()), icon: Icon(Icons.add, color: Colors.green, size: 16.0,)),

                                            ],
                                          ),
                                        ],
                                      ),



                                    ],
                                  ),

                                ),
                              );
                            });
                      }),
                ),
                GetBuilder<CartController>(
                    init: CartController(),
                    builder: (priceCalculation) {
                      String total = priceCalculation.newPrice.toString();
                        totalAmountToPay = total;
                      return SizedBox(
                        height: 170.0,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 0.5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 10.0),
                                DottedBorder(
                                  color: custom,
                                  strokeWidth: 1,
                                  child: Container(
                                    height: 40.0,
                                    width: MediaQuery.of(context).size.width,
                                    color: custom.shade100,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10.0),
                                        const Icon(
                                          Icons.monetization_on_sharp,
                                          color: Colors.yellow,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        RobotoText(
                                          text:
                                              "You're saving ${priceCalculation.totalDiscountPrice.toString()} in this order",
                                          size: 15.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const RobotoText(
                                            text: "Total Price",
                                            size: 15.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                        RobotoText(
                                            text: priceCalculation.oldPrice.toString(),
                                            size: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Discount
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const RobotoText(
                                            text: "Discount Applied",
                                            size: 15.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                        RobotoText(
                                            // text: value.oldPrice - value.totalPrice,
                                            text: priceCalculation.totalDiscountPrice.toString(),
                                            size: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ],
                                ),
                                //Sub Total

                                const SizedBox(
                                  height: 10.0,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const RobotoText(
                                      text: "Amount Payable",
                                      size: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: custom,
                                    ),
                                    RobotoText(
                                      text: priceCalculation.newPrice.toString(),
                                      size: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: custom,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  userLoggedIn();

                },
                child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: custom,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            RobotoText(
                              text: "View Details",
                              size: 13.0,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          RobotoText(
                            text: "PROCEED TO CHECKOUT",
                            size: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void userLoggedIn() async{
    var isLogIn =await MySharedPreferences.getBoolData(key: SharedRefName.isLoggedIn);
    if (isLogIn == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  CheckOutPage(total: totalAmountToPay,)));
    }
    else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogInOTP(previousScreen: "cartScreen",)));

      CustomSnackBar(context: context, text: "You need to log in first");
    }
  }



}

