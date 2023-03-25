// To parse this JSON data, do
//
//     final postsModel = postsModelFromJson(jsonString);

import 'dart:convert';

List<PostModelOne> postsModelFromJson(String str) => List<PostModelOne>.from(
    json.decode(str).map((x) => PostModelOne.fromJson(x)));

String postsModelToJson(List<PostModelOne> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModelOne {
  PostModelOne({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostModelOne.fromJson(Map<String, dynamic> json) => PostModelOne(
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
