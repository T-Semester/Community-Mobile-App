import 'dart:convert';

// CommunitiesModel? communitiesModelFromJson(String str) =>
//     CommunitiesModel.fromJson(json.decode(str));
//
// String communitiesModelToJson(CommunitiesModel? data) => json.encode(data!.toJson());

class CommunitiesModel {

  String? id;
  String? communityName;
  String? communityDescription;
  String? instructions;
  String? inviteLink;
  String? platform;
  String? status;
  String? creatorId;
  Creator? creator;

  CommunitiesModel({
    this.id,
    this.communityName,
    this.communityDescription,
    this.instructions,
    this.inviteLink,
    this.platform,
    this.status,
    this.creatorId,
    this.creator
   });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": communityName,
      "description": communityDescription,
      "instructions": instructions,
      "inviteLink": inviteLink,
      "platform": platform,
      "status": status,
      "creator_id": creatorId,
      "creator": creator,
    };
  }

  factory CommunitiesModel.fromMap(Map<String, dynamic> map) {
    return CommunitiesModel(
      id: map['id'],
      communityName: map['name'],
      communityDescription: map['description'],
      instructions: map['instructions'],
      inviteLink: map['inviteLink'],
      platform: map['platform'],
      status: map['status'],
      creatorId: map['creator_id'],

    );
  }

  String toJson() => json.encode(toMap());
  factory CommunitiesModel.fromJson(String source) => CommunitiesModel.fromMap(json.decode(source));

}

class Creator {
     String? id;
     String? bio;
     String? imageUrl;
     String? firstName;
     String? lastName;

     Creator({
       this.id,
       this.bio,
       this.imageUrl,
       this.firstName,
       this.lastName,
});

     // factory Creator.fromJson(Map<dynamic, dynamic> json) => Creator(
     //   id: json["id"],
     //   bio: json["bio"],
     //   imageUrl: json["image_url"],
     //   firstName: json["first_name"],
     //   lastName: json["last_name"],
     // );

     Map<String, dynamic> toMap() => {
       "id": id,
       "bio": bio,
       "image_url": imageUrl,
       "first_name": firstName,
       "last_name": lastName,
     };

     factory Creator.fromMap(Map<String, dynamic> map) {
       return Creator(
         id: map['id'],
         bio: map['bio'],
         imageUrl: map['image_url'],
         firstName: map['first_name'],
         lastName: map['last_name'],
       );
     }

     String get fullName => "$firstName $lastName";

    String toJson() => json.encode(toMap());
     factory Creator.fromJson(String source) => Creator.fromMap(json.decode(source));




}
