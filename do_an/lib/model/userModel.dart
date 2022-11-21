
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        id:  json["id"]
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id":id,
      };
}
