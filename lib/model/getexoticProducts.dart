// // To parse this JSON data, do
// //
// //     final getexoticproduct = getexoticproductFromJson(jsonString);

// import 'dart:convert';

// List<Getexoticproduct> getexoticproductFromJson(String str) =>
//     List<Getexoticproduct>.from(
//         json.decode(str).map((x) => Getexoticproduct.fromJson(x)));

// String getexoticproductToJson(List<Getexoticproduct> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Getexoticproduct {
//   int id;
//   String name;
//   String slug;
//   String summary;
//   String description;
//   String quantity;
//   String catId;
//   String image;
//   String price;
//   String discount;
//   String conditions;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   Getexoticproduct({
//     required this.id,
//     required this.slug,
//     required this.summary,
//     required this.name,
//     required this.description,
//     required this.quantity,
//     required this.catId,
//     required this.image,
//     required this.price,
//     required this.discount,
//     required this.conditions,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Getexoticproduct.fromJson(Map<String, dynamic> json) =>
//       Getexoticproduct(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         summary: json["summary"],
//         description: json["description"],
//         quantity: json["quantity"],
//         catId: json["cat_id"],
//         image: json["image"],
//         price: json["price"],
//         discount: json["discount"],
//         conditions: json["conditions"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "summary": summary,
//         "description": description,
//         "quantity": quantity,
//         "cat_id": catId,
//         "image": image,
//         "price": price,
//         "discount": discount,
//         "conditions": conditions,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
