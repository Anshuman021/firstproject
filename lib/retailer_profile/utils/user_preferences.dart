import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstproject/retailer_profile/model/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://tse1.mm.bing.net/th?id=OIP.iPT2f-NkI6nwmeMnV_YazAHaHa&pid=Api&P=0&w=175&h=175',
    name: 'Anshuman',
    email: 'anshuman@gmail.com',
    mobilenumber: '1234567890',
    address:
        'Jan Path, Jaipur Nagar Nigam, Lalkothi, Jaipur, Rajasthan 302016 ,Established: 1969 ,Capacity: 23,185 ',
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
