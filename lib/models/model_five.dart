// To parse this JSON data, do
//
//     final postModelFive = postModelFiveFromJson(jsonString);

import 'dart:convert';

PostModelFive postModelFiveFromJson(String str) =>
    PostModelFive.fromJson(json.decode(str));

String postModelFiveToJson(PostModelFive data) => json.encode(data.toJson());

class PostModelFive {
  PostModelFive({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  int id;
  String title;
  String body;
  String userId;

  factory PostModelFive.fromJson(Map<String, dynamic> json) => PostModelFive(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
      };
}
