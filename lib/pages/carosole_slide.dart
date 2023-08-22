import 'dart:convert';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Slider {
  List<SliderElement> sliders;

  Slider({
    required this.sliders,
  });
}

class SliderElement {
  int id;
  String burl;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  SliderElement({
    required this.id,
    required this.burl,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}

Future<List<SliderElement>> fetchPost() async {
  List<SliderElement> slider = [];

  final response = await http.get(Uri.parse('https://readyelectronics.com.bd/api/v1/slider'));
  var data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    if (data['sliders'] != null) {
      for (var sliderData in data['sliders']) {
        SliderElement element = SliderElement(
          id: sliderData['id'],
          burl: sliderData['burl'],
          image: sliderData['image'],
          status: sliderData['status'],
          createdAt: DateTime.parse(sliderData['created_at']),
          updatedAt: DateTime.parse(sliderData['updated_at']),
        );
        slider.add(element);
      }
    }
  }

  return slider;
}

class Something extends StatefulWidget {
  const Something({Key? key}) : super(key: key);

  @override
  State<Something> createState() => _SomethingState();
}

class _SomethingState extends State<Something> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
