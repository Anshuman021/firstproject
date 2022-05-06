import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/retailer_login_signup/retailermodel/retailerusermodel.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/page/retailer_editprofile.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_appbar_widget.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_button_widget.dart';
// import 'package:firstproject/retailer_profile/widget/numbers_widget.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_profile_widget.dart';

class RetailerProfilePage extends StatefulWidget {
  const RetailerProfilePage({Key? key}) : super(key: key);
  @override
  _RetailerProfilePageState createState() => _RetailerProfilePageState();
}

class _RetailerProfilePageState extends State<RetailerProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  RetailerModel loggedInUser = RetailerModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("retailers")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = RetailerModel.fromMap(value.data());
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
                imagePath: "${loggedInUser.retailerPhotoURL}",
                onClicked: () {},
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
            "${loggedInUser.retailerfirstName}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          // Text(
          //   user.email,
          //   style: const TextStyle(color: Colors.deepPurple, fontSize: 18),
          // ),
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Click here to Update profile',
        onClicked: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const RetailerEditProfilePage()),
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
              'Mobile Number',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "${loggedInUser.retailerphoneno}",
              style: const TextStyle(
                  fontSize: 18, height: 1.4, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            Text(
              "${loggedInUser.retaileremail}",
              style: const TextStyle(
                  fontSize: 18, color: Colors.deepPurple, height: 1.4),
            ),
          ],
        ),
      );
}
