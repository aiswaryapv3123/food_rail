// To parse this JSON data, do
//
//     final getProducts = getProductsFromJson(jsonString);

import 'dart:convert';

GetProducts getProductsFromJson(String str) => GetProducts.fromJson(json.decode(str));

String getProductsToJson(GetProducts data) => json.encode(data.toJson());

class GetProducts {
  GetProducts({
    this.message,
    this.data,
  });

  final String message;
  final Data data;

  factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.products,
    this.total,
  });

  final List<Product> products;
  final int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total == null ? null : total,
  };
}

class Product {
  Product({
    this.id,
    this.sku,
    this.name,
    this.description,
    this.image,
    this.price,
    this.specialPrice,
    this.availableFrom,
    this.availableTo,
    this.isVeg,
    this.variations,
  });

  final int id;
  final String sku;
  final String name;
  final String description;
  final String image;
  final String price;
  final dynamic specialPrice;
  final String availableFrom;
  final String availableTo;
  final String isVeg;
  final dynamic variations;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    sku: json["sku"] == null ? null : json["sku"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : json["image"],
    price: json["price"] == null ? null : json["price"],
    specialPrice: json["special_price"],
    availableFrom: json["available_from"] == null ? null : json["available_from"],
    availableTo: json["available_to"] == null ? null : json["available_to"],
    isVeg: json["is_veg"] == null ? null : json["is_veg"],
    variations: json["variations"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "sku": sku == null ? null : sku,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "image": image == null ? null : image,
    "price": price == null ? null : price,
    "special_price": specialPrice,
    "available_from": availableFrom == null ? null : availableFrom,
    "available_to": availableTo == null ? null : availableTo,
    "is_veg": isVeg == null ? null : isVeg,
    "variations": variations,
  };
}
