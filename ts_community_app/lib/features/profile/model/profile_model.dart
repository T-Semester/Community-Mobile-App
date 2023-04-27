import 'dart:convert';
import 'dart:io';


class ProfileModel {
  String? id;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? userName;
  String? bio;
  String? profileImage;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.userName,
    this.bio,
    this.profileImage,
});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if(id != null) {
      result.addAll({'id': id});
    }
    if(firstName !=null){
      result.addAll({'first_name': firstName});
    }
    if(lastName != null){
      result.addAll({'last_name':lastName});
    }
    if(userName != null){
      result.addAll({'username': userName});
    }
    if(profileImage !=null){
      result.addAll({'image_url': profileImage});
    }
    if(bio != null){
      result.addAll({'bio': bio});
    }
    return result;
    // return {
    //   "id": id,
    //   "first_name": firstName,
    //   "last_name": lastName,
    //   "email": emailAddress,
    //   "username": userName,
    //   "bio": bio,
    //   "image_url": profileImage,
    // };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      emailAddress: map['email'],
      userName: map['username'],
      bio: map['bio'],
      profileImage: map['image_url'],
    );
  }

  String get fullName => "$firstName $lastName";

  String toJson() => json.encode(toMap());
  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source));

}

class ImageModel {
  File? file;
  String? title;

}