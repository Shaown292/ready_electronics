class CartDataDisplayModel {
  List<CartData>? cartData;

  CartDataDisplayModel({this.cartData});

  CartDataDisplayModel.fromJson(Map<String, dynamic> json) {
    if (json['cart_data'] != null) {
      cartData = <CartData>[];
      json['cart_data'].forEach((v) {
        cartData!.add(new CartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartData != null) {
      data['cart_data'] = this.cartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartData {
  int? id;
  String? customerId;
  String? productId;
  dynamic productSize;
  dynamic productColor;
  String? quantity;
  String? createdAt;
  String? updatedAt;
  Product? product;

  CartData(
      {this.id,
        this.customerId,
        this.productId,
        this.productSize,
        this.productColor,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.product});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    productSize = json['product_size'];
    productColor = json['product_color'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['product_size'] = this.productSize;
    data['product_color'] = this.productColor;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? proCategory;
  String? proSubcategory;
  String? proChildCategory;
  String? proBrand;
  String? proName;
  String? slug;
  String? proPurchaseprice;
  String? proOldprice;
  String? proNewprice;
  String? proCode;
  String? proDescription;
  dynamic proDescription2;
  dynamic warranty;
  String? shortDescription;
  String? proQuantity;
  dynamic aditionalshipping;
  String? topSell;
  String? popular;
  dynamic video;
  String? unit;
  String? status;
  String? createdAt;
  String? updatedAt;
  Image? image;

  Product(
      {this.id,
        this.proCategory,
        this.proSubcategory,
        this.proChildCategory,
        this.proBrand,
        this.proName,
        this.slug,
        this.proPurchaseprice,
        this.proOldprice,
        this.proNewprice,
        this.proCode,
        this.proDescription,
        this.proDescription2,
        this.warranty,
        this.shortDescription,
        this.proQuantity,
        this.aditionalshipping,
        this.topSell,
        this.popular,
        this.video,
        this.unit,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proCategory = json['proCategory'];
    proSubcategory = json['proSubcategory'];
    proChildCategory = json['proChildCategory'];
    proBrand = json['proBrand'];
    proName = json['proName'];
    slug = json['slug'];
    proPurchaseprice = json['proPurchaseprice'];
    proOldprice = json['proOldprice'];
    proNewprice = json['proNewprice'];
    proCode = json['proCode'];
    proDescription = json['proDescription'];
    proDescription2 = json['proDescription2'];
    warranty = json['warranty'];
    shortDescription = json['shortDescription'];
    proQuantity = json['proQuantity'];
    aditionalshipping = json['aditionalshipping'];
    topSell = json['topSell'];
    popular = json['popular'];
    video = json['video'];
    unit = json['unit'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['proCategory'] = this.proCategory;
    data['proSubcategory'] = this.proSubcategory;
    data['proChildCategory'] = this.proChildCategory;
    data['proBrand'] = this.proBrand;
    data['proName'] = this.proName;
    data['slug'] = this.slug;
    data['proPurchaseprice'] = this.proPurchaseprice;
    data['proOldprice'] = this.proOldprice;
    data['proNewprice'] = this.proNewprice;
    data['proCode'] = this.proCode;
    data['proDescription'] = this.proDescription;
    data['proDescription2'] = this.proDescription2;
    data['warranty'] = this.warranty;
    data['shortDescription'] = this.shortDescription;
    data['proQuantity'] = this.proQuantity;
    data['aditionalshipping'] = this.aditionalshipping;
    data['topSell'] = this.topSell;
    data['popular'] = this.popular;
    data['video'] = this.video;
    data['unit'] = this.unit;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  int? id;
  String? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Image({this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
