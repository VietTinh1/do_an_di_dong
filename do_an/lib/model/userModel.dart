
import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        id:  json["id"]
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id":id,
      };
}
