
import 'dart:convert';
import 'package:get/get.dart';
import '../../constants/share_preference_name.dart';
import '../../preferences.dart';
import 'package:http/http.dart' as http;
import '../track order model/track_order_model.dart';



class TrackOrderController extends GetxController {

  TrackOrderModel? trackOrderModel;

  bool isError = false;
  String errorMessage = "";

  void fetchOrderStatus(String trackOrderId) async {


    String token = await MySharedPreferences.getStringData(key: SharedRefName.token)??"";
    try{
      http.Response response = await http.get(
        Uri.parse("https://readyelectronics.com.bd/api/v1/track/order/result/$trackOrderId"),

      );
      if(response.statusCode==200){

        trackOrderModel = TrackOrderModel.fromJson(jsonDecode(response.body.toString()));
        isError = false;
        update();

      }
      else{

        isError = true;
        errorMessage = response.body.toString();
        update();

      }
    } catch(e,tr){

      isError = true;
      errorMessage = e.toString();

    }
  }
}