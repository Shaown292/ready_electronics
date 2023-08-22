// To parse this JSON data, do
//
//     final flashSellModel = flashSellModelFromJson(jsonString);

import 'dart:convert';

FeaturesProductModel flashSellModelFromJson(String str) => FeaturesProductModel.fromJson(json.decode(str));

String flashSellModelToJson(FeaturesProductModel data) => json.encode(data.toJson());

class FeaturesProductModel {
  List<Featurproduct> featurproducts;

  FeaturesProductModel({
    required this.featurproducts,
  });

  factory FeaturesProductModel.fromJson(Map<String, dynamic> json) => FeaturesProductModel(
    featurproducts: List<Featurproduct>.from(json["featurproducts"].map((x) => Featurproduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "featurproducts": List<dynamic>.from(featurproducts.map((x) => x.toJson())),
  };
}

class Featurproduct {
  int id;
  String proCategory;
  String proSubcategory;
  dynamic proChildCategory;
  String proBrand;
  String proName;
  String slug;
  String proPurchaseprice;
  String proOldprice;
  String proNewprice;
  String proCode;
  String proDescription;
  String? proDescription2;
  String? warranty;
  String shortDescription;
  String proQuantity;
  dynamic aditionalshipping;
  String? topSell;
  String popular;
  dynamic video;
  String unit;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Image image;

  Featurproduct({
    required this.id,
    required this.proCategory,
    required this.proSubcategory,
    this.proChildCategory,
    required this.proBrand,
    required this.proName,
    required this.slug,
    required this.proPurchaseprice,
    required this.proOldprice,
    required this.proNewprice,
    required this.proCode,
    required this.proDescription,
    this.proDescription2,
    this.warranty,
    required this.shortDescription,
    required this.proQuantity,
    this.aditionalshipping,
    this.topSell,
    required this.popular,
    this.video,
    required this.unit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Featurproduct.fromJson(Map<String, dynamic> json) => Featurproduct(
    id: json["id"],
    proCategory: json["proCategory"],
    proSubcategory: json["proSubcategory"],
    proChildCategory: json["proChildCategory"],
    proBrand: json["proBrand"],
    proName: json["proName"],
    slug: json["slug"],
    proPurchaseprice: json["proPurchaseprice"],
    proOldprice: json["proOldprice"],
    proNewprice: json["proNewprice"],
    proCode: json["proCode"],
    proDescription: json["proDescription"],
    proDescription2: json["proDescription2"],
    warranty: json["warranty"],
    shortDescription: json["shortDescription"],
    proQuantity: json["proQuantity"],
    aditionalshipping: json["aditionalshipping"],
    topSell: json["topSell"],
    popular: json["popular"],
    video: json["video"],
    unit: json["unit"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "proCategory": proCategory,
    "proSubcategory": proSubcategory,
    "proChildCategory": proChildCategory,
    "proBrand": proBrand,
    "proName": proName,
    "slug": slug,
    "proPurchaseprice": proPurchaseprice,
    "proOldprice": proOldprice,
    "proNewprice": proNewprice,
    "proCode": proCode,
    "proDescription": proDescription,
    "proDescription2": proDescription2,
    "warranty": warranty,
    "shortDescription": shortDescription,
    "proQuantity": proQuantity,
    "aditionalshipping": aditionalshipping,
    "topSell": topSell,
    "popular": popular,
    "video": video,
    "unit": unit,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image.toJson(),
  };
}

class Image {
  int id;
  String productId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Image({
    required this.id,
    required this.productId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    productId: json["product_id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
