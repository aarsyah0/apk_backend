class User {
  final String name;
  final String email;
  final String? photoUrl;

  User({required this.name, required this.email, this.photoUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      photoUrl: json['photo_url'],
    );
  }
}
