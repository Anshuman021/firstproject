import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/model/farmer_datatype.dart';

class DefaultFarmer {
  static late SharedPreferences _farmerpreferences;

  static const _fkeyUser = 'fuser';
  static const farmerdetail = FarmerUser(
    F_image:
        'https://tse1.mm.bing.net/th?id=OIP.iPT2f-NkI6nwmeMnV_YazAHaHa&pid=Api&P=0&w=175&h=175',
    F_name: 'Attreya',
    F_email: 'attreya@yahoo.co.in',
    F_mobilenumber: '0987654321',
    isDarkMode: false,
  );

  static Future init() async =>
      _farmerpreferences = await SharedPreferences.getInstance();

  static Future setUser(FarmerUser fuser) async {
    final json = jsonEncode(fuser.toJson());

    await _farmerpreferences.setString(_fkeyUser, json);
  }

  static FarmerUser getUser() {
    final json = _farmerpreferences.getString(_fkeyUser);

    return json == null ? farmerdetail : FarmerUser.fromJson(jsonDecode(json));
  }
}
