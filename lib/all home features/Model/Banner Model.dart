// To parse this JSON data, do
//
//     final specialBannerModel = specialBannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel specialBannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String specialBannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  List<Bannerbottom> bannerbottom;

  BannerModel({
    required this.bannerbottom,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    bannerbottom: List<Bannerbottom>.from(json["bannerbottom"].map((x) => Bannerbottom.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bannerbottom": List<dynamic>.from(bannerbottom.map((x) => x.toJson())),
  };
}

class Bannerbottom {
  int id;
  String adcategoryId;
  String link;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Bannerbottom({
    required this.id,
    required this.adcategoryId,
    required this.link,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Bannerbottom.fromJson(Map<String, dynamic> json) => Bannerbottom(
    id: json["id"],
    adcategoryId: json["adcategory_id"],
    link: json["link"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "adcategory_id": adcategoryId,
    "link": link,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
