// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  List<Brand> brands;

  BrandModel({
    required this.brands,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
  };
}

class Brand {
  int id;
  String brandName;
  String slug;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Brand({
    required this.id,
    required this.brandName,
    required this.slug,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    brandName: json["brandName"],
    slug: json["slug"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brandName": brandName,
    "slug": slug,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
