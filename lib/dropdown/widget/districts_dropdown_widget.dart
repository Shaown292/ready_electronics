

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/dropdown/model/district_model.dart';

import '../controller/dropdown_controller.dart';


class DistrictsDropdownWidget extends StatefulWidget {
  const DistrictsDropdownWidget({Key? key }) : super(key: key);

  @override
  State<DistrictsDropdownWidget> createState() => _DistrictsDropdownWidgetState();
}

class _DistrictsDropdownWidgetState extends State<DistrictsDropdownWidget> {

  DropdownController dropdownController = Get.put(DropdownController());

  final districtName = TextEditingController(text: "Select district");

  @override
  void initState() {
    dropdownController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownController>(
      init: DropdownController(),
      builder: (districts) {
        return DropdownButton(
            padding: EdgeInsets.zero,
            iconSize: 0,
            hint: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 101,
              child: TextField(
                readOnly: true,
                controller: districtName,
                decoration: const InputDecoration(
                  // labelText: "District Name",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    suffixIcon: Icon(
                      Icons.arrow_drop_down, color: Colors.black87,)
                ),
              ),
            ),
            alignment: AlignmentDirectional.topEnd,
            underline: const SizedBox(),
            items: districts.districtDataModel?.districts?.map<DropdownMenuItem<Districts>>((data) =>
                DropdownMenuItem(
                    value: data,
                    child: Text(data.name.toString())
                )).toList(),

            onChanged: (v) {
              setState(() {
                districtName.text = v!.name.toString();
                districts.districtId = v.id.toString();
                districts.fetchAreas(v.id.toString());

              });
            });
      },
    );
  }

}