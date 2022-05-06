import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmermodel/farmerusermodel.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/page/farmer_editprofile.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_appbar_widget.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_button_widget.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_profile_widget.dart';

class FarmerProfilePage extends StatefulWidget {
  const FarmerProfilePage({Key? key}) : super(key: key);

  @override
  _FarmerProfilePageState createState() => _FarmerProfilePageState();
}

class _FarmerProfilePageState extends State<FarmerProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  FarmerModel loggedInUser = FarmerModel();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("farmers")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = FarmerModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: "${loggedInUser.farmerPhotoURL}",
                onClicked: () {
                  setState(() {});
                },
              ),

              const SizedBox(height: 24),
              buildName(),

              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              //NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName() => Column(
        children: [
          Text(
            "${loggedInUser.farmerfirstName}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Click here to Update profile',
        onClicked: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const FarmerEditProfilePage()),
          );
          setState(() {});
        },
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Email Address',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "${loggedInUser.farmeremail}",
              style: const TextStyle(
                  fontSize: 16, height: 1.4, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your Mobile Number',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "${loggedInUser.farmerphoneno}",
              style: const TextStyle(
                  fontSize: 16, height: 1.4, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
