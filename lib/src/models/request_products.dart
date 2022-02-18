// To parse this JSON data, do
//
//     final requestProducts = requestProductsFromJson(jsonString);

import 'dart:convert';

RequestProducts requestProductsFromJson(String str) => RequestProducts.fromJson(json.decode(str));

String requestProductsToJson(RequestProducts data) => json.encode(data.toJson());

class RequestProducts {
  RequestProducts({
    this.currentpage,
    this.pagesize,
    this.sortorder,
    this.searchstring,
    this.filter,
  });

  final int currentpage;
  final int pagesize;
  final Sortorder sortorder;
  final String searchstring;
  final Filter filter;

  factory RequestProducts.fromJson(Map<String, dynamic> json) => RequestProducts(
    currentpage: json["currentpage"] == null ? null : json["currentpage"],
    pagesize: json["pagesize"] == null ? null : json["pagesize"],
    sortorder: json["sortorder"] == null ? null : Sortorder.fromJson(json["sortorder"]),
    searchstring: json["searchstring"] == null ? null : json["searchstring"],
    filter: json["filter"] == null ? null : Filter.fromJson(json["filter"]),
  );

  Map<String, dynamic> toJson() => {
    "currentpage": currentpage == null ? null : currentpage,
    "pagesize": pagesize == null ? null : pagesize,
    "sortorder": sortorder == null ? null : sortorder.toJson(),
    "searchstring": searchstring == null ? null : searchstring,
    "filter": filter == null ? null : filter.toJson(),
  };
}

class Filter {
  Filter({
    this.category,
  });

  final String category;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    category: json["category"] == null ? null : json["category"],
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? null : category,
  };
}

class Sortorder {
  Sortorder({
    this.field,
    this.direction,
  });

  final String field;
  final String direction;

  factory Sortorder.fromJson(Map<String, dynamic> json) => Sortorder(
    field: json["field"] == null ? null : json["field"],
    direction: json["direction"] == null ? null : json["direction"],
  );

  Map<String, dynamic> toJson() => {
    "field": field == null ? null : field,
    "direction": direction == null ? null : direction,
  };
}
