import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/retailer_profile/model/user.dart';
import 'package:firstproject/retailer_profile/page/edit_profile_page.dart';
import 'package:firstproject/retailer_profile/utils/user_preferences.dart';
import 'package:firstproject/retailer_profile/widget/appbar_widget.dart';
import 'package:firstproject/retailer_profile/widget/button_widget.dart';
// import 'package:firstproject/retailer_profile/widget/numbers_widget.dart';
import 'package:firstproject/retailer_profile/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

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
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
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
