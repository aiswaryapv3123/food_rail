// To parse this JSON data, do
//
//     final getCategoryListData = getCategoryListDataFromJson(jsonString);

import 'dart:convert';

GetCategoryListData getCategoryListDataFromJson(String str) => GetCategoryListData.fromJson(json.decode(str));

String getCategoryListDataToJson(GetCategoryListData data) => json.encode(data.toJson());

class GetCategoryListData {
  GetCategoryListData({
    this.message,
    this.data,
  });

  final String message;
  final List<Datum> data;

  factory GetCategoryListData.fromJson(Map<String, dynamic> json) => GetCategoryListData(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.catId,
    this.catName,
    this.catImg,
    this.childData,
  });

  final int catId;
  final String catName;
  final String catImg;
  final List<ChildDatum> childData;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    catId: json["cat_id"] == null ? null : json["cat_id"],
    catName: json["cat_name"] == null ? null : json["cat_name"],
    catImg: json["cat_img"] == null ? null : json["cat_img"],
    childData: json["child_data"] == null ? null : List<ChildDatum>.from(json["child_data"].map((x) => ChildDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId == null ? null : catId,
    "cat_name": catName == null ? null : catName,
    "cat_img": catImg == null ? null : catImg,
    "child_data": childData == null ? null : List<dynamic>.from(childData.map((x) => x.toJson())),
  };
}

class ChildDatum {
  ChildDatum({
    this.catId,
    this.catName,
    this.catStatus,
    this.catImage,
  });

  final int catId;
  final String catName;
  final String catStatus;
  final String catImage;

  factory ChildDatum.fromJson(Map<String, dynamic> json) => ChildDatum(
    catId: json["cat_id"] == null ? null : json["cat_id"],
    catName: json["cat_name"] == null ? null : json["cat_name"],
    catStatus: json["cat_status"] == null ? null : json["cat_status"],
    catImage: json["cat_image"] == null ? null : json["cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId == null ? null : catId,
    "cat_name": catName == null ? null : catName,
    "cat_status": catStatus == null ? null : catStatus,
    "cat_image": catImage == null ? null : catImage,
  };
}
