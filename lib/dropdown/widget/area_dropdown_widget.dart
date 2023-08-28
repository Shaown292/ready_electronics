

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_riverpod/dropdown/model/district_model.dart';

import '../controller/dropdown_controller.dart';
import '../model/area_model.dart';


class AreaDropdownWidget extends StatefulWidget {
  const AreaDropdownWidget({Key? key }) : super(key: key);

  @override
  State<AreaDropdownWidget> createState() => _AreaDropdownWidgetState();
}

class _AreaDropdownWidgetState extends State<AreaDropdownWidget> {

  DropdownController dropdownController = Get.put(DropdownController());

  final areaName = TextEditingController(text: "Select area");

  @override
  void initState() {
    dropdownController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownController>(
      init: DropdownController(),
      builder: (area) {
        return DropdownButton(
            padding: EdgeInsets.zero,
            iconSize: 0,
            hint: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 103,
              child: TextField(
                readOnly: true,
                controller: areaName,
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
            items: area.areaDataModel?.areas?.map<DropdownMenuItem<Areas>>((data) =>
                DropdownMenuItem(
                    value: data,
                    child: Text(data.area.toString())
                )).toList(),

            onChanged: (v) {
              setState(() {
                areaName.text = v!.area.toString();
                area.areaId = v.id.toString();
              });
            });
      },
    );
  }

}