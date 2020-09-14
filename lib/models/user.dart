class User {
  final String uid;
  String displayName;
  String email;
  String photoUrl;
  bool gender;
  final bool isDeleted;

  User({
    this.uid,
    this.displayName,
    this.email,
    this.photoUrl,
    this.gender,
    this.isDeleted = false,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          uid: json['uid'],
          displayName: json['displayName'],
          email: json['email'],
          photoUrl: json['photoUrl'],
          gender: json['gender'],
          isDeleted: json['isDeleted'],
        );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'displayName': displayName,
        'email': email,
        'photoUrl': photoUrl,
        'gender': gender,
        'isDeleted': isDeleted,
      };
}
