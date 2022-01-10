// import 'dart:js';

import 'package:firstproject/retailer_items/flowers.dart';
import 'package:firstproject/retailer_items/fruits.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/farmer_login_and_register/login.dart';
import 'package:firstproject/farmer_login_and_register/register.dart';
import 'package:firstproject/farmer_menu_bar/home.dart';
import 'package:firstproject/user_verification/verification.dart';
import 'package:firstproject/retailer_login_signup/retailersignup.dart';
import 'package:firstproject/retailer_login_signup/retailerlogin.dart';
import 'package:firstproject/retailer_menu_bar/retailerdrawer.dart';
import 'package:firstproject/retailer_items/Vegetables/veg_pages/vegetables_list.dart';
import 'package:firstproject/retailer_items/grains.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailerhomepage.dart';

import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/utils/user_preferences.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/themes.dart';

import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const VerifyingUser(),
          routes: {
            'verification': (context) => const VerifyingUser(),
            'login': (context) => const Mylogin(),
            'register': (context) => const MyRegister(),
            'retailerlogin': (context) => const RetailerLogin(),
            'retailersignup': (context) => const RetailerSignUp(),
            'home': (context) => const Home(),
            'retailerdrawer': (context) => const RetailerDrawer(),
            'vegetables_list': (context) => const VegList(),
            'grains': (context) => const Grains(),
            'flowers': (context) => const Flowers(),
            'fruits': (context) => const Fruits(),
            'retailerhomepage': (context) => const RetailerHomePage(),
          },
        ),
      ),
    );
  }
}
