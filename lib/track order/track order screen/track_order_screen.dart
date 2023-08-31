
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/track%20order/track%20order%20controller/track_order_controller.dart';
import '../../cart/screen/CartButton.dart';
import '../../components/colors.dart';
import '../../components/component.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key, required this.trackId}) : super(key: key);

  final String trackId;

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {

  TrackOrderController trackOrderController = Get.put(TrackOrderController());



  @override
  void initState() {
    trackOrderController.fetchOrderStatus(widget.trackId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var widthOfTheDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: const RobotoText(
          text: "Track Your Order",
          size: 13.0,
          color: custom,
          fontWeight: null,
        ),
        iconTheme: const IconThemeData(color: custom),
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/ready_logo.png'),
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high
                      )
                  ),
                ),
              ],
            ),
            GetBuilder<TrackOrderController>(
              builder: (trackingStatus){
                if (trackingStatus.isError) {
                  return const Text("");
                }
                if(trackingStatus.trackOrderModel == null){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return  Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //status
                    Card(
                      elevation: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         SizedBox(width: widthOfTheDevice *0.15),
                           SizedBox(
                            width: widthOfTheDevice *0.35,
                              child: const RobotoText(text: "Order Status", size: 16.0, fontWeight: FontWeight.w300, color: custom,)),
                          RobotoText(text: trackingStatus.trackOrderModel!.orderinfo!.ordertype!.name, size: 16.0, fontWeight: FontWeight.w300, color: Colors.black,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),

                    //date
                    Card(
                      elevation: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           SizedBox(width:  widthOfTheDevice *0.15),
                          SizedBox(
                              width:  widthOfTheDevice *0.35,
                              child: const RobotoText(text: "Date", size: 16.0, fontWeight: FontWeight.w300, color: custom,)),
                          RobotoText(text: trackingStatus.trackOrderModel!.orderinfo!.createdAt.toString(), size: 16.0, fontWeight: FontWeight.w300, color: Colors.black,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),

                    //total
                    Card(
                      elevation: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width:  widthOfTheDevice *0.15),
                        SizedBox(
                            width:  widthOfTheDevice *0.35,
                            child: const RobotoText(text: "Total Amount", size: 16.0, fontWeight: FontWeight.w300, color: custom,)),
                          RobotoText(text: trackingStatus.trackOrderModel!.orderinfo!.orderTotal, size: 16.0, fontWeight: FontWeight.w300, color: Colors.black,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),

                    //discount
                    Card(
                      elevation: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width:  widthOfTheDevice *0.15),
                          SizedBox(
                              width:  widthOfTheDevice *0.35,
                              child: const RobotoText(text: "Discount", size: 16.0, fontWeight: FontWeight.w300, color: custom,)),
                          RobotoText(text: trackingStatus.trackOrderModel!.orderinfo!.discount, size: 16.0, fontWeight: FontWeight.w300, color: Colors.black,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),

                    //tracking id
                    Card(
                      elevation: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width:  widthOfTheDevice *0.15),
                          SizedBox(
                              width:  widthOfTheDevice *0.35,
                              child: const RobotoText(text: "Tracking ID", size: 16.0, fontWeight: FontWeight.w300, color: custom,)),
                          RobotoText(text: trackingStatus.trackOrderModel!.orderinfo!.trackingId, size: 16.0, fontWeight: FontWeight.w300, color: Colors.black,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0,),

                  ],
                );
              },

            ),
          ],
        ),
      )
    );
  }
}
