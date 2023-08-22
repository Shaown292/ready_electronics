// To parse this JSON data, do
//
//     final homeProductModel = homeProductModelFromJson(jsonString);

import 'dart:convert';

HomeProductModel homeProductModelFromJson(String str) => HomeProductModel.fromJson(json.decode(str));

String homeProductModelToJson(HomeProductModel data) => json.encode(data.toJson());

class HomeProductModel {
  List<Homeproduct> homeproducts;

  HomeProductModel({
    required this.homeproducts,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) => HomeProductModel(
    homeproducts: List<Homeproduct>.from(json["homeproducts"].map((x) => Homeproduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "homeproducts": List<dynamic>.from(homeproducts.map((x) => x.toJson())),
  };
}

class Homeproduct {
  int id;
  String name;
  String slug;
  String image;
  String icon;
  String frontProduct;
  dynamic level;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> products;

  Homeproduct({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.icon,
    required this.frontProduct,
    this.level,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  factory Homeproduct.fromJson(Map<String, dynamic> json) => Homeproduct(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    icon: json["icon"],
    frontProduct: json["frontProduct"],
    level: json["level"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "icon": icon,
    "frontProduct": frontProduct,
    "level": level,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  int id;
  String proCategory;
  String? proSubcategory;
  dynamic proChildCategory;
  String? proBrand;
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
  String? proQuantity;
  dynamic aditionalshipping;
  String? topSell;
  String? popular;
  dynamic video;
  String unit;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Image image;

  Product({
    required this.id,
    required this.proCategory,
    this.proSubcategory,
    this.proChildCategory,
    this.proBrand,
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
    this.proQuantity,
    this.aditionalshipping,
    this.topSell,
    this.popular,
    this.video,
    required this.unit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
