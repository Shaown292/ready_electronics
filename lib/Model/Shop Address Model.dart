// To parse this JSON data, do
//
//     final shopAddressModel = shopAddressModelFromJson(jsonString);

import 'dart:convert';

ShopAddressModel shopAddressModelFromJson(String str) => ShopAddressModel.fromJson(json.decode(str));

String shopAddressModelToJson(ShopAddressModel data) => json.encode(data.toJson());

class ShopAddressModel {
  List<Contact> contact;
  List<Socialicon> socialicons;

  ShopAddressModel({
    required this.contact,
    required this.socialicons,
  });

  factory ShopAddressModel.fromJson(Map<String, dynamic> json) => ShopAddressModel(
    contact: List<Contact>.from(json["contact"].map((x) => Contact.fromJson(x))),
    socialicons: List<Socialicon>.from(json["socialicons"].map((x) => Socialicon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contact": List<dynamic>.from(contact.map((x) => x.toJson())),
    "socialicons": List<dynamic>.from(socialicons.map((x) => x.toJson())),
  };
}

class Contact {
  int id;
  String phone;
  String email;
  String address;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Contact({
    required this.id,
    required this.phone,
    required this.email,
    required this.address,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone": phone,
    "email": email,
    "address": address,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Socialicon {
  int id;
  String name;
  String icon;
  String link;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Socialicon({
    required this.id,
    required this.name,
    required this.icon,
    required this.link,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Socialicon.fromJson(Map<String, dynamic> json) => Socialicon(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    link: json["link"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "link": link,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
