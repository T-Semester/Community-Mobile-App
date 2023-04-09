/// id : "a038f465-1281-429f-88b8-4b05c4d01db7"
/// created_at : "2023-03-27T10:33:59.797920Z"
/// modified_at : "2023-03-31T19:44:10.977453Z"
/// name : "Job Alerts by DigiUp"
/// description : "Building a career can be tough, and professionals have to do much work to meet the demands of the competitive job world. \n\nThis group was created by DigiUp  to help professionals build great careers and businesses by providing them access to resources and job opportunities across different industries. \n\nDigiUp is a a company that gives individuals\ra digital upgrade through her services. \n\nWhether it’s a LinkedIn Profile or CV, we are ready to do our thing to see you hit your career pursuit."
/// instructions : "none"
/// inviteLink : "https://chat.whatsapp.com/HgKMnsOmxrsJhiK9f5jJwm"
/// platform : "whatsapp"
/// status : "open_community"
/// creator_id : "6ad849f4-2a84-4467-ad80-61d027a7ceb0"
/// creator : {"id":"6ad849f4-2a84-4467-ad80-61d027a7ceb0","bio":"Product Manager","bank":"","email":"testyb22@gmail.com","seller":false,"country":"","username":"Testimony Adebiyi","image_url":"https://storage.googleapis.com/community-app-913ab.appspot.com/46ea1939-blank-profile-picture-973460_1280.webp","last_name":"Adebiyi","first_name":"Testimony","bank_account_name":"","bank_account_number":""}

class CommunityModel {
  CommunityModel({
      String? id, 
      String? createdAt, 
      String? modifiedAt, 
      String? name, 
      String? description, 
      String? instructions, 
      String? inviteLink, 
      String? platform, 
      String? status, 
      String? creatorId, 
      Creator? creator,}){
    _id = id;
    _createdAt = createdAt;
    _modifiedAt = modifiedAt;
    _name = name;
    _description = description;
    _instructions = instructions;
    _inviteLink = inviteLink;
    _platform = platform;
    _status = status;
    _creatorId = creatorId;
    _creator = creator;
}

  CommunityModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _modifiedAt = json['modified_at'];
    _name = json['name'];
    _description = json['description'];
    _instructions = json['instructions'];
    _inviteLink = json['inviteLink'];
    _platform = json['platform'];
    _status = json['status'];
    _creatorId = json['creator_id'];
    _creator = json['creator'] != null ? Creator.fromJson(json['creator']) : null;
  }
  String? _id;
  String? _createdAt;
  String? _modifiedAt;
  String? _name;
  String? _description;
  String? _instructions;
  String? _inviteLink;
  String? _platform;
  String? _status;
  String? _creatorId;
  Creator? _creator;
CommunityModel copyWith({  String? id,
  String? createdAt,
  String? modifiedAt,
  String? name,
  String? description,
  String? instructions,
  String? inviteLink,
  String? platform,
  String? status,
  String? creatorId,
  Creator? creator,
}) => CommunityModel(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  modifiedAt: modifiedAt ?? _modifiedAt,
  name: name ?? _name,
  description: description ?? _description,
  instructions: instructions ?? _instructions,
  inviteLink: inviteLink ?? _inviteLink,
  platform: platform ?? _platform,
  status: status ?? _status,
  creatorId: creatorId ?? _creatorId,
  creator: creator ?? _creator,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get modifiedAt => _modifiedAt;
  String? get name => _name;
  String? get description => _description;
  String? get instructions => _instructions;
  String? get inviteLink => _inviteLink;
  String? get platform => _platform;
  String? get status => _status;
  String? get creatorId => _creatorId;
  Creator? get creator => _creator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['modified_at'] = _modifiedAt;
    map['name'] = _name;
    map['description'] = _description;
    map['instructions'] = _instructions;
    map['inviteLink'] = _inviteLink;
    map['platform'] = _platform;
    map['status'] = _status;
    map['creator_id'] = _creatorId;
    if (_creator != null) {
      map['creator'] = _creator?.toJson();
    }
    return map;
  }

}

/// id : "6ad849f4-2a84-4467-ad80-61d027a7ceb0"
/// bio : "Product Manager"
/// bank : ""
/// email : "testyb22@gmail.com"
/// seller : false
/// country : ""
/// username : "Testimony Adebiyi"
/// image_url : "https://storage.googleapis.com/community-app-913ab.appspot.com/46ea1939-blank-profile-picture-973460_1280.webp"
/// last_name : "Adebiyi"
/// first_name : "Testimony"
/// bank_account_name : ""
/// bank_account_number : ""

class Creator {
  Creator({
      String? id, 
      String? bio, 
      String? bank, 
      String? email, 
      bool? seller, 
      String? country, 
      String? username, 
      String? imageUrl, 
      String? lastName, 
      String? firstName, 
      String? bankAccountName, 
      String? bankAccountNumber,}){
    _id = id;
    _bio = bio;
    _bank = bank;
    _email = email;
    _seller = seller;
    _country = country;
    _username = username;
    _imageUrl = imageUrl;
    _lastName = lastName;
    _firstName = firstName;
    _bankAccountName = bankAccountName;
    _bankAccountNumber = bankAccountNumber;
}

  Creator.fromJson(dynamic json) {
    _id = json['id'];
    _bio = json['bio'];
    _bank = json['bank'];
    _email = json['email'];
    _seller = json['seller'];
    _country = json['country'];
    _username = json['username'];
    _imageUrl = json['image_url'];
    _lastName = json['last_name'];
    _firstName = json['first_name'];
    _bankAccountName = json['bank_account_name'];
    _bankAccountNumber = json['bank_account_number'];
  }
  String? _id;
  String? _bio;
  String? _bank;
  String? _email;
  bool? _seller;
  String? _country;
  String? _username;
  String? _imageUrl;
  String? _lastName;
  String? _firstName;
  String? _bankAccountName;
  String? _bankAccountNumber;
Creator copyWith({  String? id,
  String? bio,
  String? bank,
  String? email,
  bool? seller,
  String? country,
  String? username,
  String? imageUrl,
  String? lastName,
  String? firstName,
  String? bankAccountName,
  String? bankAccountNumber,
}) => Creator(  id: id ?? _id,
  bio: bio ?? _bio,
  bank: bank ?? _bank,
  email: email ?? _email,
  seller: seller ?? _seller,
  country: country ?? _country,
  username: username ?? _username,
  imageUrl: imageUrl ?? _imageUrl,
  lastName: lastName ?? _lastName,
  firstName: firstName ?? _firstName,
  bankAccountName: bankAccountName ?? _bankAccountName,
  bankAccountNumber: bankAccountNumber ?? _bankAccountNumber,
);
  String? get id => _id;
  String? get bio => _bio;
  String? get bank => _bank;
  String? get email => _email;
  bool? get seller => _seller;
  String? get country => _country;
  String? get username => _username;
  String? get imageUrl => _imageUrl;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get bankAccountName => _bankAccountName;
  String? get bankAccountNumber => _bankAccountNumber;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bio'] = _bio;
    map['bank'] = _bank;
    map['email'] = _email;
    map['seller'] = _seller;
    map['country'] = _country;
    map['username'] = _username;
    map['image_url'] = _imageUrl;
    map['last_name'] = _lastName;
    map['first_name'] = _firstName;
    map['bank_account_name'] = _bankAccountName;
    map['bank_account_number'] = _bankAccountNumber;
    return map;
  }

  static List<CommunityModel> listFromJson(List? list) {  if (list == null) return [];  if (list.isEmpty) return [];  return list.map((item) => CommunityModel.fromJson(item)).toList();}



}