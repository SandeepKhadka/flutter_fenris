// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  String status;
  String role;
  dynamic image;
  dynamic activationToken;
  dynamic tokenValidate;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.status,
    required this.role,
    this.image,
    this.activationToken,
    this.tokenValidate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        status: json["status"],
        role: json["role"],
        image: json["image"],
        activationToken: json["activation_token"],
        tokenValidate: json["token_validate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "status": status,
        "role": role,
        "image": image,
        "activation_token": activationToken,
        "token_validate": tokenValidate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
