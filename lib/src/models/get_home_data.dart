// To parse this JSON data, do
//
//     final getHomeData = getHomeDataFromJson(jsonString);

import 'dart:convert';

GetHomeData getHomeDataFromJson(String str) => GetHomeData.fromJson(json.decode(str));

String getHomeDataToJson(GetHomeData data) => json.encode(data.toJson());

class GetHomeData {
  GetHomeData({
    this.message,
    this.data,
  });

  final String message;
  final Data data;

  factory GetHomeData.fromJson(Map<String, dynamic> json) => GetHomeData(
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
    this.sliderBanners,
    this.additionalBanners,
    this.featuredProducts,
    this.bestsellerProducts,
  });

  final List<Banner> sliderBanners;
  final List<Banner> additionalBanners;
  final List<FeaturedProduct> featuredProducts;
  final List<BestsellerProduct> bestsellerProducts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sliderBanners: json["slider_banners"] == null ? null : List<Banner>.from(json["slider_banners"].map((x) => Banner.fromJson(x))),
    additionalBanners: json["additional_banners"] == null ? null : List<Banner>.from(json["additional_banners"].map((x) => Banner.fromJson(x))),
    featuredProducts: json["featured_products"] == null ? null : List<FeaturedProduct>.from(json["featured_products"].map((x) => FeaturedProduct.fromJson(x))),
    bestsellerProducts: json["bestseller_products"] == null ? null : List<BestsellerProduct>.from(json["bestseller_products"].map((x) => BestsellerProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "slider_banners": sliderBanners == null ? null : List<dynamic>.from(sliderBanners.map((x) => x.toJson())),
    "additional_banners": additionalBanners == null ? null : List<dynamic>.from(additionalBanners.map((x) => x.toJson())),
    "featured_products": featuredProducts == null ? null : List<dynamic>.from(featuredProducts.map((x) => x.toJson())),
    "bestseller_products": bestsellerProducts == null ? null : List<dynamic>.from(bestsellerProducts.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    this.id,
    this.bannerOrder,
    this.bannerImg,
  });

  final int id;
  final String bannerOrder;
  final String bannerImg;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"] == null ? null : json["id"],
    bannerOrder: json["banner_order"] == null ? null : json["banner_order"],
    bannerImg: json["banner_img"] == null ? null : json["banner_img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "banner_order": bannerOrder == null ? null : bannerOrder,
    "banner_img": bannerImg == null ? null : bannerImg,
  };
}

class BestsellerProduct {
  BestsellerProduct({
    this.id,
    this.name,
    this.sku,
    this.categoryId,
    this.categoryName,
    this.isVeg,
    this.menuStatus,
    this.description,
    this.price,
    this.specialPrice,
    this.availableFrom,
    this.availableTo,
    this.image,
    this.variations,
    this.orderCount,
  });

  final int id;
  final String name;
  final String sku;
  final String categoryId;
  final String categoryName;
  final String isVeg;
  final String menuStatus;
  final String description;
  final String price;
  final dynamic specialPrice;
  final String availableFrom;
  final String availableTo;
  final String image;
  final List<BestsellerProductVariation> variations;
  final dynamic orderCount;

  factory BestsellerProduct.fromJson(Map<String, dynamic> json) => BestsellerProduct(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    sku: json["sku"] == null ? null : json["sku"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    categoryName: json["category_name"] == null ? null : json["category_name"],
    isVeg: json["is_veg"] == null ? null : json["is_veg"],
    menuStatus: json["menu_status"] == null ? null : json["menu_status"],
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"],
    specialPrice: json["special_price"],
    availableFrom: json["available_from"] == null ? null : json["available_from"],
    availableTo: json["available_to"] == null ? null : json["available_to"],
    image: json["image"] == null ? null : json["image"],
    variations: json["variations"] == null ? null : List<BestsellerProductVariation>.from(json["variations"].map((x) => BestsellerProductVariation.fromJson(x))),
    orderCount: json["order_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "sku": sku == null ? null : sku,
    "category_id": categoryId == null ? null : categoryId,
    "category_name": categoryName == null ? null : categoryName,
    "is_veg": isVeg == null ? null : isVeg,
    "menu_status": menuStatus == null ? null : menuStatus,
    "description": description == null ? null : description,
    "price": price == null ? null : price,
    "special_price": specialPrice,
    "available_from": availableFrom == null ? null : availableFrom,
    "available_to": availableTo == null ? null : availableTo,
    "image": image == null ? null : image,
    "variations": variations == null ? null : List<dynamic>.from(variations.map((x) => x.toJson())),
    "order_count": orderCount,
  };
}

class BestsellerProductVariation {
  BestsellerProductVariation({
    this.id,
    this.title,
    this.price,
    this.specialPrice,
  });

  final int id;
  final String title;
  final String price;
  final String specialPrice;

  factory BestsellerProductVariation.fromJson(Map<String, dynamic> json) => BestsellerProductVariation(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    specialPrice: json["special_price"] == null ? null : json["special_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "special_price": specialPrice == null ? null : specialPrice,
  };
}

class FeaturedProduct {
  FeaturedProduct({
    this.id,
    this.name,
    this.sku,
    this.categoryId,
    this.categoryName,
    this.isVeg,
    this.description,
    this.price,
    this.specialPrice,
    this.availableFrom,
    this.availableTo,
    this.image,
    this.variations,
  });

  final int id;
  final String name;
  final String sku;
  final String categoryId;
  final String categoryName;
  final String isVeg;
  final String description;
  final String price;
  final dynamic specialPrice;
  final String availableFrom;
  final String availableTo;
  final String image;
  final List<FeaturedProductVariation> variations;

  factory FeaturedProduct.fromJson(Map<String, dynamic> json) => FeaturedProduct(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    sku: json["sku"] == null ? null : json["sku"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    categoryName: json["category_name"] == null ? null : json["category_name"],
    isVeg: json["is_veg"] == null ? null : json["is_veg"],
    description: json["description"] == null ? null : json["description"],
    price: json["price"] == null ? null : json["price"],
    specialPrice: json["special_price"],
    availableFrom: json["available_from"] == null ? null : json["available_from"],
    availableTo: json["available_to"] == null ? null : json["available_to"],
    image: json["image"] == null ? null : json["image"],
    variations: json["variations"] == null ? null : List<FeaturedProductVariation>.from(json["variations"].map((x) => FeaturedProductVariation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "sku": sku == null ? null : sku,
    "category_id": categoryId == null ? null : categoryId,
    "category_name": categoryName == null ? null : categoryName,
    "is_veg": isVeg == null ? null : isVeg,
    "description": description == null ? null : description,
    "price": price == null ? null : price,
    "special_price": specialPrice,
    "available_from": availableFrom == null ? null : availableFrom,
    "available_to": availableTo == null ? null : availableTo,
    "image": image == null ? null : image,
    "variations": variations == null ? null : List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

class FeaturedProductVariation {
  FeaturedProductVariation({
    this.id,
    this.title,
    this.price,
    this.specialPrice,
  });

  final int id;
  final String title;
  final String price;
  final dynamic specialPrice;

  factory FeaturedProductVariation.fromJson(Map<String, dynamic> json) => FeaturedProductVariation(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    specialPrice: json["special_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "special_price": specialPrice,
  };
}
