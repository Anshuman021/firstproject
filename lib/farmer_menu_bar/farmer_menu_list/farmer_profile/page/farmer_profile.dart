import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/model/farmer_datatype.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/utils/default_farmer.dart';
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
  @override
  Widget build(BuildContext context) {
    final user = DefaultFarmer.getUser();

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
                        builder: (context) => const FarmerEditProfilePage()),
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
              'Your Email Address',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              user.email,
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
              user.mobilenumber,
              style: const TextStyle(
                  fontSize: 16, height: 1.4, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
