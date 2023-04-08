// To parse this JSON data, do
//
//     final postModelThree = postModelThreeFromJson(jsonString);

import 'dart:convert';

List<PostModelThree> postModelThreeFromJson(String str) =>
    List<PostModelThree>.from(
        json.decode(str).map((x) => PostModelThree.fromJson(x)));

String postModelThreeToJson(List<PostModelThree> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModelThree {
  PostModelThree({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory PostModelThree.fromJson(Map<String, dynamic> json) => PostModelThree(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
