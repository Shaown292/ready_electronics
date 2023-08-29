class TrackOrderModel {
  String? status;
  Orderinfo? orderinfo;

  TrackOrderModel({this.status, this.orderinfo});

  TrackOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderinfo = json['orderinfo'] != null
        ? new Orderinfo.fromJson(json['orderinfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.orderinfo != null) {
      data['orderinfo'] = this.orderinfo!.toJson();
    }
    return data;
  }
}

class Orderinfo {
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

  Orderinfo(
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
        this.ordertype});

  Orderinfo.fromJson(Map<String, dynamic> json) {
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
