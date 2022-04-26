import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/cupertino.dart';
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
// import 'package:email_auth/email_auth.dart';

class FarmerEditProfilePage extends StatefulWidget {
  const FarmerEditProfilePage({Key? key}) : super(key: key);
  @override
  _FarmerEditProfilePageState createState() => _FarmerEditProfilePageState();
}

class _FarmerEditProfilePageState extends State<FarmerEditProfilePage> {
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _otpController = TextEditingController();
  // final TextEditingController _phonenoController = TextEditingController();
  // final _formkey = GlobalKey<FormState>();
  // late EmailAuth emailAuth;
  late FarmerUser user;

  @override
  void initState() {
    super.initState();

    // emailAuth = EmailAuth(
    //   sessionName: "OTP for Retailer",
    // );

    user = DefaultFarmer.getUser();
  }

  // void sendOtp() async {
  //   //EmailAuth emailAuth = EmailAuth(sessionName: "Testing session");
  //   var res = await emailAuth.sendOtp(
  //       recipientMail: _emailController.value.text, otpLength: 4);
  //   if (res) {
  //     // print("OTP sent");
  //     showDialog(
  //         barrierDismissible: false,
  //         context: this.context,
  //         builder: (BuildContext context) {
  //           return CupertinoAlertDialog(
  //             title: const Text("OTP Sent Successfully !"),
  //             actions: [
  //               CupertinoDialogAction(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               ),
  //             ],
  //           );
  //         });
  //   } else {
  //     // print("otp not sent");
  //     showDialog(
  //       barrierDismissible: false,
  //       context: this.context,
  //       builder: (BuildContext context) {
  //         return CupertinoAlertDialog(
  //           title: const Text("OTP Not sent"),
  //           content: const Text(
  //               "Error due to the Invalid Email please re-enter email"),
  //           actions: [
  //             CupertinoDialogAction(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: const Text("OK"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  // void verifyOTP() {
  //   var res = emailAuth.validateOtp(
  //       recipientMail: _emailController.value.text,
  //       userOtp: _otpController.text);
  //   if (res) {
  //     // print("OTP verified");
  //     showDialog(
  //         barrierDismissible: false,
  //         context: this.context,
  //         builder: (BuildContext context) {
  //           return CupertinoAlertDialog(
  //             title: const Text("OTP Verified"),
  //             actions: [
  //               CupertinoDialogAction(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               ),
  //             ],
  //           );
  //         });
  //   } else {
  //     // print("NOT valid otp");

  //     showDialog(
  //         barrierDismissible: false,
  //         context: this.context,
  //         builder: (BuildContext context) {
  //           return CupertinoAlertDialog(
  //             title: const Text("OTP"),
  //             content: const Text("Incorrect OTP"),
  //             actions: [
  //               CupertinoDialogAction(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               ),
  //             ],
  //           );
  //         });
  //   }
  // }

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
