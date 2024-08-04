// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

List<AdminModel> adminModelFromJson(String str) =>
    List<AdminModel>.from(json.decode(str).map((x) => AdminModel.fromJson(x)));

String adminModelToJson(List<AdminModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminModel {
  String id;
  String name;
  String address;
  int phone;
  String createdAt;
  String image;
  int cityId;

  AdminModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.createdAt,
    required this.image,
    required this.cityId,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        createdAt: json["created_at"],
        image: json["image"],
        cityId: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "created_at": createdAt,
        "image": image,
        "city": cityId,
      };
}
