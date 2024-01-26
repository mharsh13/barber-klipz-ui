// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Model/post_model.dart';

class CommentModel {
  String id;
  String text;
  String user_id;
  String post_id;
  String created_at;
  String updated_at;
  AllUserModel user;
  int replies_count;
  int likes_count;
  bool liked;

  CommentModel({
    required this.id,
    required this.text,
    required this.user_id,
    required this.post_id,
    required this.created_at,
    required this.updated_at,
    required this.user,
    required this.replies_count,
    required this.likes_count,
    required this.liked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'user_id': user_id,
      'post_id': post_id,
      'created_at': created_at,
      'updated_at': updated_at,
      'user': user.toMap(),
      'replies_count': replies_count,
      'likes_count': likes_count,
      'liked': liked,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as String,
      text: map['text'] as String,
      user_id: map['user_id'] as String,
      post_id: map['post_id'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      user: AllUserModel.fromMap(map['user'] as Map<String, dynamic>),
      replies_count: map['replies_count'] as int,
      likes_count: map['likes_count'] as int,
      liked: map['liked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
