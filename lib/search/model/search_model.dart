class SearchModel {
  Products? products;

  SearchModel({this.products});

  SearchModel.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Products(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
