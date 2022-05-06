import 'dart:convert';

// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/model/retailer_datatype.dart';

class DefaultRetailer {
  static late SharedPreferences _retailerpreferences;
  static const _rkeyUser = 'ruser';
  static const retailerdetail = RetailerUser(
    imagePath:
        "https://cdn0.iconfinder.com/data/icons/messenger/154/avatar-login-human-man-user-sign-label-512.png",
    name: "Anshuman",
    email: 'anshuman@gmail.com',
    mobilenumber: '1234567890',
    // address:'Jan Path Jaipur Nagar Nigam Lalkothi Jaipur Rajasthan 302016 Established 1969 Capacity 23 185 ',
    isDarkMode: false,
  );

  static Future init() async =>
      _retailerpreferences = await SharedPreferences.getInstance();

  static Future setUser(RetailerUser ruser) async {
    final json = jsonEncode(ruser.toJson());

    await _retailerpreferences.setString(_rkeyUser, json);
  }

  static RetailerUser getUser() {
    final json = _retailerpreferences.getString(_rkeyUser);

    return json == null
        ? retailerdetail
        : RetailerUser.fromJson(jsonDecode(json));
  }
}
