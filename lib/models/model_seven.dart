// To parse this JSON data, do
//
//     final postModelSeven = postModelSevenFromJson(jsonString);

import 'dart:convert';

PostModelSeven postModelSevenFromJson(String str) =>
    PostModelSeven.fromJson(json.decode(str));

String postModelSevenToJson(PostModelSeven data) => json.encode(data.toJson());

class PostModelSeven {
  PostModelSeven();

  factory PostModelSeven.fromJson(Map<String, dynamic> json) =>
      PostModelSeven();

  Map<String, dynamic> toJson() => {};
}
