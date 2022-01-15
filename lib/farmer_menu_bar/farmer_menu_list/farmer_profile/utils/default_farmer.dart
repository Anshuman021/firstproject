import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/model/farmer_datatype.dart';

class DefaultFarmer {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://tse1.mm.bing.net/th?id=OIP.iPT2f-NkI6nwmeMnV_YazAHaHa&pid=Api&P=0&w=175&h=175',
    name: 'Attreya',
    email: 'attreya@yahoo.co.in',
    mobilenumber: '0987654321',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
