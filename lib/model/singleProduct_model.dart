// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

ProductDetail productDetailFromJson(String str) => ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
    String? id;
    String? name;
    Data? data;

    ProductDetail({
        this.id,
        this.name,
        this.data,
    });

    factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
    };
}

class Data {
    String? color;
    String? capacity;

    Data({
        this.color,
        this.capacity,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacity: json["capacity"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "capacity": capacity,
};
}