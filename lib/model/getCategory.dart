// To parse this JSON data, do
//
//     final getCategories = getCategoriesFromJson(jsonString);

import 'dart:convert';

List<GetCategories> getCategoriesFromJson(String str) =>
    List<GetCategories>.from(
        json.decode(str).map((x) => GetCategories.fromJson(x)));

String getCategoriesToJson(List<GetCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCategories {
  int id;
  String title;
  String slug;
  String summary;
  String isParent;
  dynamic parentId;
  dynamic image;
  String status;
  String addedBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic parentInfo;

  GetCategories({
    required this.id,
    required this.title,
    required this.slug,
    required this.summary,
    required this.isParent,
    required this.parentId,
    required this.image,
    required this.status,
    required this.addedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.parentInfo,
  });

  factory GetCategories.fromJson(Map<String, dynamic> json) => GetCategories(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        summary: json["summary"],
        isParent: json["is_parent"],
        parentId: json["parent_id"],
        image: json["image"],
        status: json["status"],
        addedBy: json["added_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        parentInfo: json["parent_info"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "summary": summary,
        "is_parent": isParent,
        "parent_id": parentId,
        "image": image,
        "status": status,
        "added_by": addedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "parent_info": parentInfo,
      };
}
