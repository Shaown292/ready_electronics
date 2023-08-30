// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

SliderModel productModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String productModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  List<Slider> sliders;

  SliderModel({
    required this.sliders,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    sliders: List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
  };
}

class Slider {
  int id;
  String burl;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Slider({
    required this.id,
    required this.burl,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    id: json["id"],
    burl: json["burl"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "burl": burl,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
