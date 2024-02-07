import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class StoryModel {
  String id;
  String media_type;
  String media_url;
  int likes_count;
  int loves_count;
  int views_count;
  bool liked;
  String created_at;
  String updated_at;
  StoryModel({
    required this.id,
    required this.media_type,
    required this.media_url,
    required this.likes_count,
    required this.loves_count,
    required this.views_count,
    required this.liked,
    required this.created_at,
    required this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'media_type': media_type,
      'media_url': media_url,
      'likes_count': likes_count,
      'loves_count': loves_count,
      'views_count': views_count,
      'liked': liked,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'] as String,
      media_type: map['media_type'] as String,
      media_url: map['media_url'] as String,
      likes_count: map['likes_count'] as int,
      loves_count: map['loves_count'] as int,
      views_count: map['views_count'] as int,
      liked: map['liked'] as bool,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryModel.fromJson(String source) =>
      StoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
