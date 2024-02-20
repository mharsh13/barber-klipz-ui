import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FollowingModel {
  String id;
  String email;
  String phone;
  String user_name;
  String? first_name;
  String? last_name;
  String profile_image;
  String cover_image;
  String? bio;
  String? website;
  String? birthday;
  bool email_verified;
  int followingCount;
  int followerCount;
  String created_at;
  String updated_at;

  FollowingModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.user_name,
    this.first_name,
    this.last_name,
    required this.profile_image,
    required this.cover_image,
    this.bio,
    this.website,
    this.birthday,
    required this.email_verified,
    required this.followingCount,
    required this.followerCount,
    required this.created_at,
    required this.updated_at,
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
      'followingCount': followingCount,
      'followerCount': followerCount,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory FollowingModel.fromMap(Map<String, dynamic> map) {
    return FollowingModel(
      id: map['id'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      user_name: map['user_name'] as String,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      profile_image: map['profile_image'] as String,
      cover_image: map['cover_image'] as String,
      bio: map['bio'] != null ? map['bio'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      email_verified: map['email_verified'] as bool,
      followingCount: map['followingCount'] as int,
      followerCount: map['followerCount'] as int,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowingModel.fromJson(String source) =>
      FollowingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
