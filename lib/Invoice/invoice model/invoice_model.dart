class InvoiceDataModel {
  OrderInfo? orderInfo;

  InvoiceDataModel({this.orderInfo});

  InvoiceDataModel.fromJson(Map<String, dynamic> json) {
    orderInfo = json['orderInfo'] != null
        ? new OrderInfo.fromJson(json['orderInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderInfo != null) {
      data['orderInfo'] = this.orderInfo!.toJson();
    }
    return data;
  }
}

class OrderInfo {
  String? orderIdPrimary;
  String? customerId;
  String? shippingId;
  String? orderTotal;
  String? discount;
  String? bkashFee;
  String? trackingId;
  String? orderStatus;
  String? cancelRequest;
  String? createdAt;
  String? updatedAt;
  Ordertype? ordertype;
  Customer? customer;
  List<Orderdetails>? orderdetails;
  Payment? payment;
  Shipping? shipping;

  OrderInfo(
      {this.orderIdPrimary,
        this.customerId,
        this.shippingId,
        this.orderTotal,
        this.discount,
        this.bkashFee,
        this.trackingId,
        this.orderStatus,
        this.cancelRequest,
        this.createdAt,
        this.updatedAt,
        this.ordertype,
        this.customer,
        this.orderdetails,
        this.payment,
        this.shipping});

  OrderInfo.fromJson(Map<String, dynamic> json) {
    orderIdPrimary = json['orderIdPrimary'];
    customerId = json['customerId'];
    shippingId = json['shippingId'];
    orderTotal = json['orderTotal'];
    discount = json['discount'];
    bkashFee = json['bkashFee'];
    trackingId = json['trackingId'];
    orderStatus = json['orderStatus'];
    cancelRequest = json['cancelRequest'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ordertype = json['ordertype'] != null
        ? new Ordertype.fromJson(json['ordertype'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['orderdetails'] != null) {
      orderdetails = <Orderdetails>[];
      json['orderdetails'].forEach((v) {
        orderdetails!.add(new Orderdetails.fromJson(v));
      });
    }
    payment =
    json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderIdPrimary'] = this.orderIdPrimary;
    data['customerId'] = this.customerId;
    data['shippingId'] = this.shippingId;
    data['orderTotal'] = this.orderTotal;
    data['discount'] = this.discount;
    data['bkashFee'] = this.bkashFee;
    data['trackingId'] = this.trackingId;
    data['orderStatus'] = this.orderStatus;
    data['cancelRequest'] = this.cancelRequest;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.ordertype != null) {
      data['ordertype'] = this.ordertype!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.orderdetails != null) {
      data['orderdetails'] = this.orderdetails!.map((v) => v.toJson()).toList();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    return data;
  }
}

class Ordertype {
  int? id;
  String? name;
  String? slug;
  dynamic createdAt;
  dynamic updatedAt;

  Ordertype({this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  Ordertype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Customer {
  int? id;
  String? fullName;
  String? phoneNumber;
  dynamic address;
  dynamic email;
  String? verifyToken;
  dynamic passResetToken;
  String? image;
  dynamic provider;
  dynamic providerId;
  String? mypoint;
  String? status;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
        this.fullName,
        this.phoneNumber,
        this.address,
        this.email,
        this.verifyToken,
        this.passResetToken,
        this.image,
        this.provider,
        this.providerId,
        this.mypoint,
        this.status,
        this.createdAt,
        this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    email = json['email'];
    verifyToken = json['verifyToken'];
    passResetToken = json['passResetToken'];
    image = json['image'];
    provider = json['provider'];
    providerId = json['provider_id'];
    mypoint = json['mypoint'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    data['verifyToken'] = this.verifyToken;
    data['passResetToken'] = this.passResetToken;
    data['image'] = this.image;
    data['provider'] = this.provider;
    data['provider_id'] = this.providerId;
    data['mypoint'] = this.mypoint;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Orderdetails {
  String? orderDetails;
  String? orderId;
  String? productId;
  String? productName;
  String? productSize;
  String? productColor;
  String? productPrice;
  String? proPurchaseprice;
  String? productQuantity;
  String? createdAt;
  String? updatedAt;

  Orderdetails(
      {this.orderDetails,
        this.orderId,
        this.productId,
        this.productName,
        this.productSize,
        this.productColor,
        this.productPrice,
        this.proPurchaseprice,
        this.productQuantity,
        this.createdAt,
        this.updatedAt});

  Orderdetails.fromJson(Map<String, dynamic> json) {
    orderDetails = json['orderDetails'];
    orderId = json['orderId'];
    productId = json['ProductId'];
    productName = json['productName'];
    productSize = json['productSize'];
    productColor = json['productColor'];
    productPrice = json['productPrice'];
    proPurchaseprice = json['proPurchaseprice'];
    productQuantity = json['productQuantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderDetails'] = this.orderDetails;
    data['orderId'] = this.orderId;
    data['ProductId'] = this.productId;
    data['productName'] = this.productName;
    data['productSize'] = this.productSize;
    data['productColor'] = this.productColor;
    data['productPrice'] = this.productPrice;
    data['proPurchaseprice'] = this.proPurchaseprice;
    data['productQuantity'] = this.productQuantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Payment {
  String? paymentIdPrimary;
  String? orderId;
  String? paymentType;
  dynamic senderId;
  dynamic transectionId;
  String? paymentStatus;
  dynamic bkashFee;
  String? createdAt;
  String? updatedAt;

  Payment(
      {this.paymentIdPrimary,
        this.orderId,
        this.paymentType,
        this.senderId,
        this.transectionId,
        this.paymentStatus,
        this.bkashFee,
        this.createdAt,
        this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    paymentIdPrimary = json['paymentIdPrimary'];
    orderId = json['orderId'];
    paymentType = json['paymentType'];
    senderId = json['senderId'];
    transectionId = json['transectionId'];
    paymentStatus = json['paymentStatus'];
    bkashFee = json['bkashFee'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentIdPrimary'] = this.paymentIdPrimary;
    data['orderId'] = this.orderId;
    data['paymentType'] = this.paymentType;
    data['senderId'] = this.senderId;
    data['transectionId'] = this.transectionId;
    data['paymentStatus'] = this.paymentStatus;
    data['bkashFee'] = this.bkashFee;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Shipping {
  String? shippingPrimariId;
  String? customerId;
  String? name;
  String? phone;
  String? address;
  String? district;
  String? area;
  String? shippingfee;
  dynamic note;
  String? createdAt;
  String? updatedAt;

  Shipping(
      {this.shippingPrimariId,
        this.customerId,
        this.name,
        this.phone,
        this.address,
        this.district,
        this.area,
        this.shippingfee,
        this.note,
        this.createdAt,
        this.updatedAt});

  Shipping.fromJson(Map<String, dynamic> json) {
    shippingPrimariId = json['shippingPrimariId'];
    customerId = json['customerId'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    district = json['district'];
    area = json['area'];
    shippingfee = json['shippingfee'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shippingPrimariId'] = this.shippingPrimariId;
    data['customerId'] = this.customerId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['district'] = this.district;
    data['area'] = this.area;
    data['shippingfee'] = this.shippingfee;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
