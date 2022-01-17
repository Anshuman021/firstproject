// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmerLogin.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmerSignUp.dart';
import 'package:firstproject/farmer_menu_bar/farmer_drawer_body.dart';
import 'package:firstproject/user_verification/verification.dart';
import 'package:firstproject/retailer_login_signup/retailersignup.dart';
import 'package:firstproject/retailer_login_signup/retailerlogin.dart';
import 'package:firstproject/retailer_menu_bar/Retailer_drawer_body.dart';
import 'package:firstproject/retailer_items/Vegetables/veg_pages/vegetables_list.dart';
import 'package:firstproject/retailer_items/Fruits/fruits_pages/fruits_list.dart';
import 'package:firstproject/retailer_items/Grains/grains_pages/grain_list.dart';
import 'package:firstproject/retailer_items/Flowers/flower_pages/flower_list.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/utils/default_retailer.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/utils/default_farmer.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
//import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/farmer_themes.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/retailer_themes.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await DefaultRetailer.init();
  await DefaultFarmer.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final retailer = DefaultRetailer.getUser();
    // ignore: unused_local_variable
    final farmer = DefaultFarmer.getUser();

    return ThemeProvider(
      initTheme: retailer.isDarkMode
          ? RetailerTheme.darkTheme
          : RetailerTheme.lightTheme,
      //initTheme:farmer.isDarkMode ? FarmerTheme.darkTheme : FarmerTheme.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const VerifyingUser(),
          routes: {
            'verification': (context) => const VerifyingUser(),
            'login': (context) => const FarmerLogin(),
            'register': (context) => const FarmerSignUp(),
            'retailerlogin': (context) => const RetailerLogin(),
            'retailersignup': (context) => const RetailerSignUp(),
            'Retailer_drawer_body': (context) => const RetailerDrawerBody(),
            'farmer_drawer_body': (context) => const FarmerDrawerBody(),
            'vegetables_list': (context) => const VegList(),
            'fruits_list': (context) => const FruitsList(),
            'grain_list': (context) => const GrainList(),
            'flower_list': (context) => const FlowerList(),
          },
        ),
      ),
    );
  }
}
