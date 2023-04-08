// To parse this JSON data, do
//
//     final postModelFour = postModelFourFromJson(jsonString);

import 'dart:convert';

PostModelFour postModelFourFromJson(String str) =>
    PostModelFour.fromJson(json.decode(str));

String postModelFourToJson(PostModelFour data) => json.encode(data.toJson());

class PostModelFour {
  PostModelFour({
    required this.userId,
    required this.title,
    required this.body,
    required this.id,
  });

  String userId;
  String title;
  String body;
  int id;

  factory PostModelFour.fromJson(Map<String, dynamic> json) => PostModelFour(
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "body": body,
        "id": id,
      };
}
