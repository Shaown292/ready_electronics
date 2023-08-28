import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_riverpod/dropdown/model/area_model.dart';
import 'package:http/http.dart' as http;
import 'package:testing_riverpod/dropdown/model/district_model.dart';

class DropdownController extends GetxController{

   String? areaId;
   String? districtId;

  DistrictDataModel? districtDataModel ;
  AreaDataModel? areaDataModel;

  @override
  void onInit() {
    fetchDistricts();
    super.onInit();
  }

  void fetchDistricts() async {
    final response = await http.get(Uri.parse("https://readyelectronics.com.bd/api/v1/districts"));

    if (response.statusCode == 200) {
      districtDataModel = DistrictDataModel.fromJson(jsonDecode(response.body));
      update();
    }
  }

  void fetchAreas(String id) async {
    final response = await http.get(Uri.parse("https://readyelectronics.com.bd/api/v1/areas/$id"));

    if (response.statusCode == 200) {
      areaDataModel= AreaDataModel.fromJson(jsonDecode(response.body));
      update();
    }
  }
}

