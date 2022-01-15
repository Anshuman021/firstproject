import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/model/retailer_datatype.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/utils/default_retailer.dart';
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
  @override
  Widget build(BuildContext context) {
    final user = DefaultRetailer.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const RetailerEditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              //NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.deepPurple, fontSize: 18),
          ),
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Click Above Image to Update profile',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
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
              user.mobilenumber,
              style: const TextStyle(
                  fontSize: 16, height: 1.4, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
            const Text(
              'Address',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.address,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ],
        ),
      );
}
