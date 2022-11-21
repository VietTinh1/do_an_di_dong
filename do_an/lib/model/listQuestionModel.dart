import 'dart:convert';

ListQuestion userFromJson(String str) =>
    ListQuestion.fromJson(json.decode(str));

String userToJson(ListQuestion data) => json.encode(data.toJson());

class ListQuestion {
  ListQuestion({
    required this.id_ListQuestion,
    required this.id_Question,
    required this.timer,
  });

  String id_ListQuestion;
  String id_Question;
  DateTime timer;

  factory ListQuestion.fromJson(Map<String, dynamic> json) =>
      ListQuestion(
        id_ListQuestion: json["id_listquestion"],
         id_Question: json["id_question"],
         timer: json["timer"]
         );

  Map<String, dynamic> toJson() => {
        "id_listquestion": id_ListQuestion,
        "id_question": id_Question,
        "timer":timer,
      };
}
