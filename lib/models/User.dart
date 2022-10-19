// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.avatar,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.check,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? avatar;
  String? role;
  dynamic createdAt;
  dynamic updatedAt;
  String? check;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        avatar: json["avatar"],
        role: json["Role"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        check: json["check"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "avatar": avatar,
        "Role": role,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "check": check,
      };
}
