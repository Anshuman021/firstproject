import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/model/farmer_datatype.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/utils/default_farmer.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_appbar_widget.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_button_widget.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_profile_widget.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_textfield_widget.dart';
import 'package:path/path.dart';

class FarmerEditProfilePage extends StatefulWidget {
  const FarmerEditProfilePage({Key? key}) : super(key: key);
  @override
  _FarmerEditProfilePageState createState() => _FarmerEditProfilePageState();
}

class _FarmerEditProfilePageState extends State<FarmerEditProfilePage> {
  late FarmerUser user;

  @override
  void initState() {
    super.initState();

    user = DefaultFarmer.getUser();
  }

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.F_image,
                  isEdit: true,
                  onClicked: () async {
                    final image = await ImagePicker()
                        // ignore: deprecated_member_use
                        .getImage(source: ImageSource.gallery);

                    if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage =
                        await File(image.path).copy(imageFile.path);

                    setState(() => user = user.copy(F_image: newImage.path));
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.F_name,
                  onChanged: (name) => user = user.copy(F_name: name),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.F_email,
                  onChanged: (email) => user = user.copy(F_email: email),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Mobile Number',
                  text: user.F_mobilenumber,
                  maxLines: 1,
                  onChanged: (mobilenumber) =>
                      user = user.copy(F_mobilenumber: mobilenumber),
                ),
                const SizedBox(height: 24),
                //const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Update Profile',
                  onClicked: () {
                    DefaultFarmer.setUser(user);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
