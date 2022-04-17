class FarmerUser {
  final String F_image;
  final String F_name;
  final String F_email;
  final String F_mobilenumber;
  final bool isDarkMode;

  const FarmerUser({
    required this.F_image,
    required this.F_name,
    required this.F_email,
    required this.F_mobilenumber,
    required this.isDarkMode,
  });

  FarmerUser copy({
    String? F_image,
    String? F_name,
    String? F_email,
    String? F_mobilenumber,
    bool? isDarkMode,
  }) =>
      FarmerUser(
        F_image: F_image ?? this.F_image,
        F_name: F_name ?? this.F_name,
        F_email: F_email ?? this.F_email,
        F_mobilenumber: F_mobilenumber ?? this.F_mobilenumber,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static FarmerUser fromJson(Map<String, dynamic> json) => FarmerUser(
        F_image: json['imagePath'],
        F_name: json['name'],
        F_email: json['email'],
        F_mobilenumber: json['mobilenumber'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': F_image,
        'name': F_name,
        'email': F_email,
        'mobilenumber': F_mobilenumber,
        'isDarkMode': isDarkMode,
      };
}
