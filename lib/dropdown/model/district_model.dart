class DistrictDataModel {
  List<Districts>? districts;

  DistrictDataModel({this.districts});

  DistrictDataModel.fromJson(Map<String, dynamic> json) {
    if (json['districts'] != null) {
      districts = <Districts>[];
      json['districts'].forEach((v) {
        districts!.add(new Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.districts != null) {
      data['districts'] = this.districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Districts {
  int? id;
  String? divisionId;
  String? name;
  String? bnName;
  String? lat;
  String? lon;
  String? website;
  String? status;
  Null? createdAt;
  Null? updatedAt;

  Districts(
      {this.id,
        this.divisionId,
        this.name,
        this.bnName,
        this.lat,
        this.lon,
        this.website,
        this.status,
        this.createdAt,
        this.updatedAt});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    name = json['name'];
    bnName = json['bn_name'];
    lat = json['lat'];
    lon = json['lon'];
    website = json['website'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_id'] = this.divisionId;
    data['name'] = this.name;
    data['bn_name'] = this.bnName;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['website'] = this.website;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
