import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmerLogin.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmermodel/farmerusermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_appbar_widget.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_button_widget.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/widget/f_textfield_widget.dart';
import 'package:path/path.dart';
// import 'package:email_auth/email_auth.dart';

class FarmerEditProfilePage extends StatefulWidget {
  const FarmerEditProfilePage({Key? key}) : super(key: key);
  @override
  _FarmerEditProfilePageState createState() => _FarmerEditProfilePageState();
}

class _FarmerEditProfilePageState extends State<FarmerEditProfilePage> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadurl;

  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _otpController = TextEditingController();
  // final TextEditingController _phonenoController = TextEditingController();
  // final _formkey = GlobalKey<FormState>();
  // late EmailAuth emailAuth;

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

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        print('Image Path $_image');
        Fluttertoast.showToast(
            msg: "Update the Profile!", textColor: Colors.redAccent);
        uploadPic();
      } else {
        Fluttertoast.showToast(
            msg: "No file selected! ", textColor: Colors.redAccent);
      }
    });
  }

  Future uploadPic() async {
    String fileName = basename(_image!.path);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Fluttertoast.showToast(
        msg: "Photo Uploading ... ", textColor: Colors.blueAccent);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("FarmerProfileCollection/${fileName}");
    await ref.putFile(_image!);
    downloadurl = await ref.getDownloadURL();
    print(downloadurl);
    // await firebaseFirestore.collection("FlowerList").doc(flowerName).set({
    //   "flowerName": flowerName,
    //   "flowerDescription": flowerDescription,
    //   "flowerPrice": flowerPrice,
    //   "flowerImgUrl": downloadurl
    // });

    loggedInUser.farmerPhotoURL = downloadurl;
    await firebaseFirestore.collection("farmers").doc(loggedInUser.fuid).set({
      "farmeremail": loggedInUser.farmeremail,
      "farmerfirstName": loggedInUser.farmerfirstName,
      "farmerphoneno": loggedInUser.farmerphoneno,
      "farmerpassword": loggedInUser.farmerpassword,
      "fuid": loggedInUser.fuid,
      "farmerPhotoURL": loggedInUser.farmerPhotoURL
    });

    // await firebaseFirestore
    //     .collection("farmers")
    //     .doc(loggedInUser.fuid)
    //     .collection("FlowerCreatedByYou")
    //     .doc(flowerName)
    //     .set({
    //   "flowerName": flowerName,
    //   "flowerDescription": flowerDescription,
    //   "flowerPrice": flowerPrice,
    //   "flowerImgUrl": downloadurl
    // });

    setState(() {
      print("Profile Picture uploaded");
      Fluttertoast.showToast(
          msg: "Photo Uploaded !", textColor: Colors.greenAccent);
    });
  }

  // late FarmerUser user;

  // @override
  // void initState() {
  //   super.initState();

  //   // emailAuth = EmailAuth(
  //   //   sessionName: "OTP for Retailer",
  //   // );

  //   user = DefaultFarmer.getUser();
  // }

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
                Container(
                  height: 100.0,
                  width: 98.0,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    child: ClipOval(
                      child: SizedBox(
                        width: 110.0,
                        height: 110.0,
                        child: (_image == null)
                            ? Image.network(
                                "${loggedInUser.farmerPhotoURL}",
                                fit: BoxFit.cover,
                              )
                            : Image.file(_image!, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.photo,
                      size: 30.0,
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ),
                // ProfileWidget(
                //   imagePath: (_image==null)

                //   onClicked: () async {
                // final image = await ImagePicker()
                //     // ignore: deprecated_member_use
                //     .getImage(source: ImageSource.gallery);

                // if (image == null) return;

                // final directory = await getApplicationDocumentsDirectory();
                // final name = basename(image.path);
                // final imageFile = File('${directory.path}/$name');
                // final newImage =
                //     await File(image.path).copy(imageFile.path);

                // setState(() => user = user.copy(F_image: newImage.path));
                //   },
                // ),
                const SizedBox(height: 24),

                TextFieldWidget(
                  label: 'Full Name',
                  text: "${loggedInUser.farmerfirstName}",
                  // onChanged: (name) => user = user.copy(F_name: name),
                  onChanged: (String name) {
                    if (name != loggedInUser.farmerfirstName) {
                      loggedInUser.farmerfirstName = name;
                    } else {
                      loggedInUser.farmerfirstName =
                          loggedInUser.farmerfirstName;
                    }
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: "${loggedInUser.farmeremail}",
                  // onChanged: (email) => user = user.copy(F_email: email),
                  onChanged: (String email) {
                    if (email != loggedInUser.farmeremail) {
                      loggedInUser.farmeremail = email;
                    } else {
                      loggedInUser.farmeremail = loggedInUser.farmeremail;
                    }
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Mobile Number',
                  text: "${loggedInUser.farmerphoneno}",
                  onChanged: (String phoneNo) {
                    if (phoneNo != loggedInUser.farmerphoneno) {
                      loggedInUser.farmerphoneno = phoneNo;
                    } else {
                      loggedInUser.farmerphoneno = loggedInUser.farmerphoneno;
                    }
                  },

                  maxLines: 1,
                  // onChanged: (mobilenumber) =>
                  // user = user.copy(F_mobilenumber: mobilenumber),
                ),
                const SizedBox(height: 24),
                //const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Update Profile',
                  onClicked: () {
                    UpdateProfile()
                        .whenComplete(() => Navigator.pushReplacement(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => const FarmerLogin()),
                            ));
                    ;
                    // DefaultFarmer.setUser(user);
                    // Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Future UpdateProfile() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection("farmers").doc(loggedInUser.fuid).set({
      "farmeremail": loggedInUser.farmeremail,
      "farmerfirstName": loggedInUser.farmerfirstName,
      "farmerphoneno": loggedInUser.farmerphoneno,
      "farmerpassword": loggedInUser.farmerpassword,
      "fuid": loggedInUser.fuid,
      "farmerPhotoURL": loggedInUser.farmerPhotoURL
    });
    Fluttertoast.showToast(
        msg: "Please Login Again :) ", textColor: Colors.greenAccent);
  }
}
