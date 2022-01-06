class User {
  final String imagePath;
  final String name;
  final String email;
  final String mobilenumber;
  final String address;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.mobilenumber,
    required this.address,
    required this.isDarkMode,
  });

  User copy({
    String? imagePath,
    String? name,
    String? email,
    String? mobilenumber,
    String? address,
    bool? isDarkMode,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        mobilenumber: mobilenumber ?? this.mobilenumber,
        address: address ?? this.address,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        mobilenumber: json['mobilenumber'],
        address: json['address'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'mobilenumber': mobilenumber,
        'address': address,
        'isDarkMode': isDarkMode,
      };
}
