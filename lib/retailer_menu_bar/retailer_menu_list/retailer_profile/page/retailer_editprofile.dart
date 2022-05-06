import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firstproject/retailer_login_signup/retailerlogin.dart';
import 'package:firstproject/retailer_login_signup/retailermodel/retailerusermodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_appbar_widget.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_button_widget.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/widget/r_textfield_widget.dart';
import 'package:path/path.dart';

class RetailerEditProfilePage extends StatefulWidget {
  const RetailerEditProfilePage({Key? key}) : super(key: key);
  @override
  _RetailerEditProfilePageState createState() =>
      _RetailerEditProfilePageState();
}

class _RetailerEditProfilePageState extends State<RetailerEditProfilePage> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadurl;
  final _formkey = GlobalKey<FormState>();

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
        .child("RetailerProfileCollection/${fileName}");
    await ref.putFile(_image!);
    downloadurl = await ref.getDownloadURL();
    print(downloadurl);
    // await firebaseFirestore.collection("FlowerList").doc(flowerName).set({
    //   "flowerName": flowerName,
    //   "flowerDescription": flowerDescription,
    //   "flowerPrice": flowerPrice,
    //   "flowerImgUrl": downloadurl
    // });

    loggedInUser.retailerPhotoURL = downloadurl;
    await firebaseFirestore.collection("retailers").doc(loggedInUser.ruid).set({
      "retaileremail": loggedInUser.retaileremail,
      "retailerfirstName": loggedInUser.retailerfirstName,
      "retailerphoneno": loggedInUser.retailerphoneno,
      "retailerpassword": loggedInUser.retailerpassword,
      "ruid": loggedInUser.ruid,
      "retailerPhotoURL": loggedInUser.retailerPhotoURL
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
                                "${loggedInUser.retailerPhotoURL}",
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
                const SizedBox(height: 24),

                // Container(
                //   child: Form(
                //     key: _formkey,
                //     child: Column(

                //       children: <Widget>[

                //       ],

                //     )

                //   ),
                // ),
                TextFieldWidget(
                  label: 'Full Name',
                  text: "${loggedInUser.retailerfirstName}",
                  onChanged: (String name) {
                    if (name != loggedInUser.retailerfirstName) {
                      loggedInUser.retailerfirstName = name;
                    } else {
                      loggedInUser.retailerfirstName =
                          loggedInUser.retailerfirstName;
                    }
                  },
                ),

                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: "${loggedInUser.retaileremail}",
                  onChanged: (String email) {
                    if (email != loggedInUser.retaileremail) {
                      loggedInUser.retaileremail = email;
                    } else {
                      loggedInUser.retaileremail = loggedInUser.retaileremail;
                    }
                  },
                ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.of(context).pushReplacement(MaterialPageRoute(
                //           builder: (context) =>
                //               const EmailChangeForRetailer()));
                //     },
                //     child: const Text("Verify Email")),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Mobile Number',
                  text: "${loggedInUser.retailerphoneno}",
                  maxLines: 1,
                  onChanged: (String phoneNo) {
                    if (phoneNo != loggedInUser.retailerphoneno) {
                      loggedInUser.retailerphoneno = phoneNo;
                    } else {
                      loggedInUser.retailerphoneno =
                          loggedInUser.retailerphoneno;
                    }
                  },
                ),
                const SizedBox(height: 24),
                // TextFieldWidget(
                //   label: 'Address',
                //   text: user.address,
                //   maxLines: 5,
                //   onChanged: (address) => user = user.copy(address: address),
                // ),
                // const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Update Profile',
                  onClicked: () {
                    UpdateProfile()
                        .whenComplete(() => Navigator.pushReplacement(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => const RetailerLogin()),
                            ));
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
    await firebaseFirestore.collection("retailers").doc(loggedInUser.ruid).set({
      "retaileremail": loggedInUser.retaileremail,
      "retailerfirstName": loggedInUser.retailerfirstName,
      "retailerphoneno": loggedInUser.retailerphoneno,
      "retailerpassword": loggedInUser.retailerpassword,
      "ruid": loggedInUser.ruid,
      "retailerPhotoURL": loggedInUser.retailerPhotoURL
    });
    Fluttertoast.showToast(
        msg: "Please Login Again :) ", textColor: Colors.greenAccent);
  }
}
