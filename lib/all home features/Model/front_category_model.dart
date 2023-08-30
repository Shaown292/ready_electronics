// To parse this JSON data, do
//
//     final allCategoryModel = allCategoryModelFromJson(jsonString);

import 'dart:convert';

FrontCategoryModel allCategoryModelFromJson(String str) => FrontCategoryModel.fromJson(json.decode(str));

String allCategoryModelToJson(FrontCategoryModel data) => json.encode(data.toJson());

class FrontCategoryModel {
  List<Category> categories;

  FrontCategoryModel({
    required this.categories,
  });

  factory FrontCategoryModel.fromJson(Map<String, dynamic> json) => FrontCategoryModel(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
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
  List<Subcategory> subcategories;
  List<Product> products;

  Category({
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
    required this.subcategories,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
    subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
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
    "subcategories": List<dynamic>.from(subcategories.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  int id;
  String proCategory;
  String? proSubcategory;
  String? proChildCategory;
  String? proBrand;
  String proName;
  String slug;
  String proPurchaseprice;
  String proOldprice;
  String proNewprice;
  String? proCode;
  String proDescription;
  String? proDescription2;
  String? warranty;
  String? shortDescription;
  String? proQuantity;
  dynamic aditionalshipping;
  String? topSell;
  String? popular;
  dynamic video;
  String? unit;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Image> images;

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
    this.proCode,
    required this.proDescription,
    this.proDescription2,
    this.warranty,
    this.shortDescription,
    this.proQuantity,
    this.aditionalshipping,
    this.topSell,
    this.popular,
    this.video,
    this.unit,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
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
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
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
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
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

class Subcategory {
  int id;
  String subcategoryName;
  String slug;
  String categoryId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Childcategory> childcategories;

  Subcategory({
    required this.id,
    required this.subcategoryName,
    required this.slug,
    required this.categoryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.childcategories,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["id"],
    subcategoryName: json["subcategoryName"],
    slug: json["slug"],
    categoryId: json["category_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    childcategories: List<Childcategory>.from(json["childcategories"].map((x) => Childcategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subcategoryName": subcategoryName,
    "slug": slug,
    "category_id": categoryId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "childcategories": List<dynamic>.from(childcategories.map((x) => x.toJson())),
  };
}

class Childcategory {
  int id;
  String childcategoryName;
  String slug;
  String subcategoryId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Childcategory({
    required this.id,
    required this.childcategoryName,
    required this.slug,
    required this.subcategoryId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Childcategory.fromJson(Map<String, dynamic> json) => Childcategory(
    id: json["id"],
    childcategoryName: json["childcategoryName"],
    slug: json["slug"],
    subcategoryId: json["subcategory_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "childcategoryName": childcategoryName,
    "slug": slug,
    "subcategory_id": subcategoryId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
