import 'dart:convert';

class ProfileModel {
  String? id;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userName;
  String? bio;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.userName,
    this.bio,
});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress,
      "username": userName,
      "bio": bio,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      emailAddress: map['email'],
      userName: map['username'],
      bio: map['bio'],
    );
  }

  String get fullName => "$firstName $lastName";

  String toJson() => json.encode(toMap());
  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source));

}