// ♦ Uploading the "UserModel" in Firebase
//   → by Creating the "User Model":
class UserModel {

  // ♦ Properties:
  final String name;
  final String uid;
  final String profilePic;
  final bool isOnline;
  final String phoneNumber;
  final List<String> groupId;

  // ♦ Constructor:
  UserModel({
    required this.name,
    required this.uid,
    required this.profilePic,
    required this.isOnline,
    required this.phoneNumber,
    required this.groupId,
  });

  // ♦ The "toMap()" Method
  //     → for "Converting Properties" to an "Object Format" ("Map"):
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
    };
  }

  // ♦ The "fromMap()" Method
  //     → which will Take a "Map"
  //     → that it will "Convert" into a "User Model":
  factory UserModel.fromMap(Map<String, dynamic> map) {
    // ♦♦ Returning an "User Model":
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      profilePic: map['profilePic'] ?? '',
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      groupId: List<String>.from(map['groupId']),
    );
  }
}
