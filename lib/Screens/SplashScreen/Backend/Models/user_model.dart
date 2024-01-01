import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String id;
  String email;
  String phone;
  String user_name;
  String first_name;
  String last_name;
  String bio;
  String website;
  String birthday;
  bool email_verified;
  String created_at;
  String updated_at;

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.user_name,
    required this.first_name,
    required this.last_name,
    required this.bio,
    required this.website,
    required this.birthday,
    required this.email_verified,
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
      'bio': bio,
      'website': website,
      'birthday': birthday,
      'email_verified': email_verified,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      user_name: map['user_name'] as String,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      bio: map['bio'] as String,
      website: map['website'] as String,
      birthday: map['birthday'] as String,
      email_verified: map['email_verified'] as bool,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
