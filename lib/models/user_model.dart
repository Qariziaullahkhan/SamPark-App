class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? phone;
  final String? about;
  final String? createdAt;
  final String? lastOnlineStatus;
  final String? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.phone,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
    this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['ProfileImage'],
      phone: json['phone'],
      about: json['about'],
      createdAt: json['createdAt'],
      lastOnlineStatus: json['lastOnlineStatus'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'ProfileImage': profileImage,
      'phone': phone,
      'about': about,
      'createdAt': createdAt,
      'lastOnlineStatus': lastOnlineStatus,
      'status': status,
    };
  }
}
