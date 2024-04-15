// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'dart:convert';

List<Banner> bannerFromJson(String str) =>
    List<Banner>.from(json.decode(str).map((x) => Banner.fromJson(x)));

String bannerToJson(List<Banner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Banner {
  int id;
  String title;
  String image;
  String status;
  dynamic addedBy;
  dynamic createdAt;
  dynamic updatedAt;

  Banner({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.addedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        status: json["status"],
        addedBy: json["added_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "status": status,
        "added_by": addedBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
