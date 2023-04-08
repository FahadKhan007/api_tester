// To parse this JSON data, do
//
//     final postModelSix = postModelSixFromJson(jsonString);

import 'dart:convert';

PostModelSix postModelSixFromJson(String str) =>
    PostModelSix.fromJson(json.decode(str));

String postModelSixToJson(PostModelSix data) => json.encode(data.toJson());

class PostModelSix {
  PostModelSix({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  String userId;
  int id;
  String title;
  String body;

  factory PostModelSix.fromJson(Map<String, dynamic> json) => PostModelSix(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
