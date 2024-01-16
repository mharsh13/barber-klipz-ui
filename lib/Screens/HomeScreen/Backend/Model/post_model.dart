// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
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
  AllUserModel user;

  PostModel({
    required this.id,
    required this.caption,
    required this.media_type,
    required this.media_url,
    required this.likes_count,
    required this.loves_count,
    this.location,
    required this.comments_count,
    required this.created_at,
    required this.updated_at,
    required this.liked,
    required this.user,
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
      'user': user.toMap(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
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
      user: AllUserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AllUserModel {
  String id;
  String email;
  String phone;
  String user_name;
  String? first_name;
  String? last_name;
  String? profile_image;
  String? cover_image;
  String? bio;
  String? website;
  String? birthday;
  bool email_verified;
  String created_at;
  String updated_at;
  String password;
  String otp;

  AllUserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.user_name,
    this.first_name,
    this.last_name,
    this.profile_image,
    this.cover_image,
    this.bio,
    this.website,
    this.birthday,
    required this.email_verified,
    required this.created_at,
    required this.updated_at,
    required this.password,
    required this.otp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'phone': phone,
      'user_name': user_name,
      'first_name': first_name,
      'last_name': last_name,
      'profile_image': profile_image,
      'cover_image': cover_image,
      'bio': bio,
      'website': website,
      'birthday': birthday,
      'email_verified': email_verified,
      'created_at': created_at,
      'updated_at': updated_at,
      'password': password,
      'otp': otp,
    };
  }

  factory AllUserModel.fromMap(Map<String, dynamic> map) {
    return AllUserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      user_name: map['user_name'] as String,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      profile_image:
          map['profile_image'] != null ? map['profile_image'] as String : null,
      cover_image:
          map['cover_image'] != null ? map['cover_image'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      email_verified: map['email_verified'] as bool,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      password: map['password'] as String,
      otp: map['otp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllUserModel.fromJson(String source) =>
      AllUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
