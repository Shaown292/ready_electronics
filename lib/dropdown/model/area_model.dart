class AreaDataModel {
  List<Areas>? areas;

  AreaDataModel({this.areas});

  AreaDataModel.fromJson(Map<String, dynamic> json) {
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  int? id;
  String? districtId;
  String? area;
  String? bnName;
  String? shippingfee;
  String? status;
  String? createdAt;
  String? updatedAt;

  Areas(
      {this.id,
        this.districtId,
        this.area,
        this.bnName,
        this.shippingfee,
        this.status,
        this.createdAt,
        this.updatedAt});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtId = json['district_id'];
    area = json['area'];
    bnName = json['bn_name'];
    shippingfee = json['shippingfee'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_id'] = this.districtId;
    data['area'] = this.area;
    data['bn_name'] = this.bnName;
    data['shippingfee'] = this.shippingfee;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
