// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  String adminId;
  String title;
  String description;
  int price;
  String quantity;
  String address;
  String createdAt;
  int phone;
  String imageUrl;
  String category;
  int cityId;

  ProductModel({
    required this.id,
    required this.adminId,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.address,
    required this.createdAt,
    required this.phone,
    required this.imageUrl,
    required this.category,
    required this.cityId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        adminId: json["admin_id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        address: json["address"],
        createdAt: json["created_at"],
        phone: json["phone"],
        imageUrl: json["image_url"],
        category: json["category"],
        cityId: json["city_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "title": title,
        "description": description,
        "price": price,
        "quantity": quantity,
        "address": address,
        "created_at": createdAt,
        "phone": phone,
        "image_url": imageUrl,
        "category": category,
        "city_id": cityId,
      };
}
