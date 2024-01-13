// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreatePostModel {
  String id;
  String caption;
  String media_type;
  String media_url;
  int likes_count;
  int loves_count;
  String? location;
  int comments_count;
  String created_at;
  String updated_at;
  bool liked;

  CreatePostModel({
    required this.id,
    required this.caption,
    required this.media_type,
    required this.media_url,
    required this.likes_count,
    required this.loves_count,
    required this.location,
    required this.comments_count,
    required this.created_at,
    required this.updated_at,
    required this.liked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'caption': caption,
      'media_type': media_type,
      'media_url': media_url,
      'likes_count': likes_count,
      'loves_count': loves_count,
      'location': location,
      'comments_count': comments_count,
      'created_at': created_at,
      'updated_at': updated_at,
      'liked': liked,
    };
  }

  factory CreatePostModel.fromMap(Map<String, dynamic> map) {
    return CreatePostModel(
      id: map['id'] as String,
      caption: map['caption'] as String,
      media_type: map['media_type'] as String,
      media_url: map['media_url'] as String,
      likes_count: map['likes_count'] as int,
      loves_count: map['loves_count'] as int,
      location: map['location'] != null ? map['location'] as String : null,
      comments_count: map['comments_count'] as int,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      liked: map['liked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatePostModel.fromJson(String source) =>
      CreatePostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
