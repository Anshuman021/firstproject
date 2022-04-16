import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/model/retailer_datatype.dart';

class DefaultRetailer {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        "https://cdn0.iconfinder.com/data/icons/messenger/154/avatar-login-human-man-user-sign-label-512.png",
    name: 'Anshuman',
    email: 'anshuman@gmail.com',
    mobilenumber: '1234567890',
    address:
        'Jan Path Jaipur Nagar Nigam Lalkothi Jaipur Rajasthan 302016 Established 1969 Capacity 23 185 ',
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
