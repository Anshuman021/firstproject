// import 'dart:js';

import 'package:firstproject/farmer_items/FarmerFlower/FarmerCreatingFlower.dart';
import 'package:firstproject/farmer_items/FarmerFruit/FarmerCreatingFruit.dart';
import 'package:firstproject/farmer_items/FarmerGrain/FarmerCreatingGrain.dart';
import 'package:firstproject/farmer_items/FarmerVegetable/FarmerCreatingVegetable.dart';
import 'package:firstproject/retailer_items/Flowers/flowerlist.dart';
import 'package:firstproject/retailer_items/Fruits/fruitlist.dart';
import 'package:firstproject/retailer_items/Grains/grainlist.dart';
import 'package:firstproject/retailer_items/Vegetables/vegetablelist.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailercart.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmerLogin.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmerSignUp.dart';
import 'package:firstproject/farmer_menu_bar/farmer_drawer_body.dart';
import 'package:firstproject/user_verification/verification.dart';
import 'package:firstproject/retailer_login_signup/retailersignup.dart';
import 'package:firstproject/retailer_login_signup/retailerlogin.dart';
import 'package:firstproject/retailer_menu_bar/Retailer_drawer_body.dart';

import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/utils/default_retailer.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/utils/default_farmer.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
//import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/farmer_themes.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/retailer_themes.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // initTheme:farmer.isDarkMode ? FarmerTheme.darkTheme : FarmerTheme.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const VerifyingUser(),
          routes: {
            'verification': (context) => const VerifyingUser(),
            'farmerLogin': (context) => const FarmerLogin(),
            'farmerSignUp': (context) => const FarmerSignUp(),
            'retailerlogin': (context) => const RetailerLogin(),
            'retailersignup': (context) => const RetailerSignUp(),
            'Retailer_drawer_body': (context) => const RetailerDrawerBody(),
            'farmer_drawer_body': (context) => const FarmerDrawerBody(),
            'flowerlist': (context) => const FlowerList(),
            'fruitlist': (context) => const FruitList(),
            'grainlist': (context) => const GrainList(),
            'vegetablelist': (context) => VegetableList(),
            'FarmerCreatingVegetable': (context) =>
                const FarmerCreatingVegetable(),
            'FarmerCreatingFruit': (context) => const FarmerCreatingFruit(),
            'FarmerCreatingGrain': (context) => const FarmerCreatingGrain(),
            'FarmerCreatingFlower': (context) => const FarmerCreatingFlower(),
          },
        ),
      ),
    );
  }
}
