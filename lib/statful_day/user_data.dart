class UserData {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  // factory UserData.fromJson(Map<String, dynamic> json) {
  //   return UserData(
  //     id: json['id'] as String,
  //     name: json['name'] as String,
  //     email: json['email'] as String,
  //     createdAt: DateTime.parse(json['createdAt'] as String),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'createdAt': createdAt.toIso8601String(),
  //   };
  // }
}
