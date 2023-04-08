// To parse this JSON data, do
//
//     final postsModelTwo = postsModelTwoFromJson(jsonString);

import 'dart:convert';

PostModelTwo postsModelTwoFromJson(String str) =>
    PostModelTwo.fromJson(json.decode(str));

String postsModelTwoToJson(PostModelTwo data) => json.encode(data.toJson());

class PostModelTwo {
  PostModelTwo({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostModelTwo.fromJson(Map<String, dynamic> json) => PostModelTwo(
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
