// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.data,
    });

    List<Datum>?data;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.productId,
        this.productName,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
    });

    int? productId;
    String? productName;
    String? description;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"] == null ? null : json["product_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_name": productName == null ? null : productName,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}
