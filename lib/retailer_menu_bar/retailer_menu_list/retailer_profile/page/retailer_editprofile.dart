import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/model/retailer_datatype.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/utils/default_retailer.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_appbar_widget.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_button_widget.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_profile_widget.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_textfield_widget.dart';
import 'package:path/path.dart';

class RetailerEditProfilePage extends StatefulWidget {
  const RetailerEditProfilePage({Key? key}) : super(key: key);
  @override
  _RetailerEditProfilePageState createState() =>
      _RetailerEditProfilePageState();
}

class _RetailerEditProfilePageState extends State<RetailerEditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = DefaultRetailer.getUser();
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
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {
                    final image = await ImagePicker()
                        .getImage(source: ImageSource.gallery);

                    if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage =
                        await File(image.path).copy(imageFile.path);

                    setState(() => user = user.copy(imagePath: newImage.path));
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) => user = user.copy(name: name),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) => user = user.copy(email: email),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Mobile Number',
                  text: user.mobilenumber,
                  maxLines: 1,
                  onChanged: (mobilenumber) =>
                      user = user.copy(mobilenumber: mobilenumber),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Address',
                  text: user.address,
                  maxLines: 5,
                  onChanged: (address) => user = user.copy(address: address),
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Update Profile',
                  onClicked: () {
                    DefaultRetailer.setUser(user);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
