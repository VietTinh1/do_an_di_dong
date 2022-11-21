  import 'dart:convert';

Field questionFromJson(String str) => Field.fromJson(json.decode(str));

String questionToJson(Field data) => json.encode(data.toJson());

class Field {
  Field({
    
required this.id_field,
required this.name_field,
  });
String id_field;
String name_field;


  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id_field: json["id_field"] ?? "",
        name_field: json["name_field"] ?? "",

      );

  Map<String, dynamic> toJson() => {
        "id_field": id_field,
        "name_field": name_field
      };
}
