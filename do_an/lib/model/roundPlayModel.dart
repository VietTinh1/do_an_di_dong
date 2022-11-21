
import 'dart:convert';

RoundPlay userFromJson(String str) => RoundPlay.fromJson(json.decode(str));

String userToJson(RoundPlay data) => json.encode(data.toJson());

class RoundPlay {
  RoundPlay({
    required this.id_user,
    required this.id_ListQuestion,
    required this.timer,
    required this.Point,

  });

  String id_user;
  String id_ListQuestion;
  DateTime timer;
  int Point;

  factory RoundPlay.fromJson(Map<String, dynamic> json) => RoundPlay(
        id_user: json["id_user"],
        id_ListQuestion:  json["id_listquestion"],
        timer: json["timer"],
        Point: json["point"],
      );

  Map<String, dynamic> toJson() => {
        "name": id_user,
        "id":id_ListQuestion,
        "":timer,
        "":Point,
      };
}
