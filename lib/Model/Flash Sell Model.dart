// To parse this JSON data, do
//
//     final flashSellModel = flashSellModelFromJson(jsonString);

import 'dart:convert';

FlashSellModel flashSellModelFromJson(String str) => FlashSellModel.fromJson(json.decode(str));

String flashSellModelToJson(FlashSellModel data) => json.encode(data.toJson());

class FlashSellModel {
  Products products;

  FlashSellModel({
    required this.products,
  });

  factory FlashSellModel.fromJson(Map<String, dynamic> json) => FlashSellModel(
    products: Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "products": products.toJson(),
  };
}

class Products {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Products({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
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
  String? proCode;
  String proDescription;
  dynamic proDescription2;
  dynamic warranty;
  String shortDescription;
  String proQuantity;
  dynamic aditionalshipping;
  String topSell;
  String? popular;
  dynamic video;
  String? unit;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Image image;

  Datum({
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
    this.proCode,
    required this.proDescription,
    this.proDescription2,
    this.warranty,
    required this.shortDescription,
    required this.proQuantity,
    this.aditionalshipping,
    required this.topSell,
    this.popular,
    this.video,
    this.unit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
