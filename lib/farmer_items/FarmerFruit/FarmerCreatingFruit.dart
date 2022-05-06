// import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmermodel/farmerusermodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class FarmerCreatingFruit extends StatefulWidget {
  const FarmerCreatingFruit({Key? key}) : super(key: key);

  @override
  State<FarmerCreatingFruit> createState() => _FarmerCreatingFruitState();
}

class _FarmerCreatingFruitState extends State<FarmerCreatingFruit> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadurl;
  List fruit = List.empty();
  String fruitName = "";
  String fruitDescription = "";
  String fruitPrice = "";
  String fruitImgUrl = "";

  User? user = FirebaseAuth.instance.currentUser;
  FarmerModel loggedInUser = FarmerModel();

  @override
  void initState() {
    super.initState();
    fruit = ["Hello", "Hey There"];
    FirebaseFirestore.instance
        .collection("farmers")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = FarmerModel.fromMap(value.data());
      setState(() {});
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   fruit = ["Hello", "Hey There"];
  // }

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        print('Image Path $_image');
        Fluttertoast.showToast(
            msg: "Click on Upload ! ", textColor: Colors.redAccent);
      } else {
        Fluttertoast.showToast(
            msg: "No file selected :) ", textColor: Colors.redAccent);
      }
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image!.path);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Fluttertoast.showToast(msg: "Uploading ... ", textColor: Colors.blueAccent);
    Reference ref = FirebaseStorage.instance.ref().child("fruits/${fileName}");
    await ref.putFile(_image!);
    downloadurl = await ref.getDownloadURL();
    print(downloadurl);
    // await firebaseFirestore
    //     .collection("TODOS")
    //     .doc(title)
    //     .collection("VegetableImage")
    //     .add({'imgurl': downloadurl});
    await firebaseFirestore.collection("FruitList").doc(fruitName).set({
      "fruitName": fruitName,
      "fruitDescription": fruitDescription,
      "fruitPrice": fruitPrice,
      "fruitImgUrl": downloadurl
    });

    await firebaseFirestore
        .collection("farmers")
        .doc(loggedInUser.fuid)
        .collection("FruitCreatedByYou")
        .doc(fruitName)
        .set({
      "fruitName": fruitName,
      "fruitDescription": fruitDescription,
      "fruitPrice": fruitPrice,
      "fruitImgUrl": downloadurl
    });

    setState(() {
      print("Profile Picture uploaded");
      Fluttertoast.showToast(
          msg: "Photo Uploaded :) ", textColor: Colors.greenAccent);
    });

    Fluttertoast.showToast(
        msg: "Item Saved :) ", textColor: Colors.greenAccent);
  }

  Future fruitStoringInYourAccount(String fruitName, String fruitDesc,
      String fruitPrice, String fruitImageUrl) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("farmers")
        .doc(loggedInUser.fuid)
        .collection("FruitCreatedByYou")
        .doc(fruitName)
        .set({
      "fruitName": fruitName,
      "fruitDescription": fruitDesc,
      "fruitPrice": fruitPrice,
      "fruitImgUrl": fruitImageUrl
    });
  }

  createFruit() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("FruitList").doc(fruitName);

    Map<String, String> fruitList = {
      "fruitName": fruitName,
      "fruitDescription": fruitDescription,
      "fruitPrice": fruitPrice,
      "fruitImgUrl": fruitImgUrl
    };

    documentReference
        .set(fruitList)
        .whenComplete(() => print("Data stored successfully"));

    fruitStoringInYourAccount(
        fruitName, fruitDescription, fruitPrice, fruitImgUrl);
  }

  Future fruitDeletingFromYourAccount(String fruitName) async {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("farmers")
        .doc(loggedInUser.fuid)
        .collection("FruitCreatedByYou")
        .doc(fruitName);

    documentReference.delete();
  }

  deleteFruit(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("FruitList").doc(item);

    documentReference.delete().whenComplete(() => Fluttertoast.showToast(
        msg: "Product Deleted ! ", textColor: Colors.redAccent));

    fruitDeletingFromYourAccount(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Fruits"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("farmers")
            .doc(loggedInUser.fuid)
            .collection("FruitCreatedByYou")
            .orderBy("fruitPrice")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                      snapshot.data?.docs[index];
                  return Dismissible(
                      key: Key(index.toString()),
                      child: Card(
                        color: Color.fromARGB(255, 238, 210, 228),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        elevation: 20,
                        shadowColor: Color.fromARGB(255, 195, 20, 163),
                        margin:
                            const EdgeInsets.fromLTRB(12.0, 19.0, 12.0, 12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Builder(builder: (context) {
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1.0, bottom: 4.0),
                                  child: Row(children: <Widget>[
                                    Text(
                                        (documentSnapshot != null)
                                            ? (documentSnapshot["fruitName"])
                                            : "",
                                        style: const TextStyle(
                                            fontSize: 22,
                                            color: Color.fromARGB(
                                                255, 16, 111, 155))),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 6.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                        height: 90,
                                        width: 180,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Text(
                                            (documentSnapshot != null)
                                                ? ((documentSnapshot[
                                                            "fruitDescription"] !=
                                                        null)
                                                    ? documentSnapshot[
                                                        "fruitDescription"]
                                                    : "")
                                                : "",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 48, 102, 203)),
                                            textAlign: TextAlign.justify,
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 100.0,
                                      width: 98.0,
                                      // decoration: const BoxDecoration(
                                      //   image: DecorationImage(
                                      //     image: AssetImage(
                                      //         'assets/RetailerFlowers/Abutilon.jpg'),
                                      //     fit: BoxFit.fill,
                                      //   ),
                                      //   shape: BoxShape.circle,
                                      // ),
                                      // Text(
                                      //   (documentSnapshot != null)
                                      //       ? (documentSnapshot["imgurl"])
                                      //       : const Center(
                                      //               child: Text("No Image"),
                                      //             ),
                                      //   ),

                                      child: CircleAvatar(
                                        radius: 100,
                                        backgroundColor:
                                            Color.fromARGB(255, 0, 0, 0),
                                        child: ClipOval(
                                          child: SizedBox(
                                            width: 110.0,
                                            height: 110.0,
                                            child: ((documentSnapshot![
                                                        "fruitImgUrl"] ==
                                                    null))
                                                ? const Center(
                                                    child: Text("No Image"),
                                                  )
                                                : Image.network(
                                                    (documentSnapshot[
                                                        "fruitImgUrl"]),
                                                    fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 60.0),
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
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 1.0),
                                  child: Row(children: <Widget>[
                                    Text(
                                      (documentSnapshot != null)
                                          ? ((documentSnapshot["fruitPrice"] !=
                                                  null)
                                              ? "₹ " +
                                                  documentSnapshot[
                                                      "fruitPrice"] +
                                                  "/Kg"
                                              : "")
                                          : "",
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.green),
                                    ),
                                    const Spacer(),
                                    Container(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            //todos.removeAt(index);
                                            deleteFruit(
                                                (documentSnapshot != null)
                                                    ? (documentSnapshot[
                                                        "fruitName"])
                                                    : "");
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20.0,
                                        ),
                                        label: const Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.amber),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    RaisedButton(
                                      color: const Color(0xff476cfb),
                                      onPressed: () {
                                        uploadPic(context);
                                      },
                                      elevation: 4.0,
                                      splashColor: Colors.blueGrey,
                                      child: const Text(
                                        'Upload',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            );
                          }),
                        ),
                      ));
                });
          }
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.red,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text("Add Fruit"),
                  content: Container(
                    width: 500,
                    height: 350,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(255, 207, 212, 240),
                              filled: true,
                              hintText: "Fruit Name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            onChanged: (String value) {
                              fruitName = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(255, 229, 231, 238),
                              filled: true,
                              hintText: "Description",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            onChanged: (String value) {
                              fruitDescription = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(255, 207, 240, 238),
                              filled: true,
                              hintText: "Price",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 209, 14, 244),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (String value) {
                              fruitPrice = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            createFruit();
                          });
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                              msg: "Select Image from Gallery! ",
                              textColor: Colors.redAccent);
                        },
                        child: const Text(
                          "Save Fruit",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Color.fromARGB(255, 223, 217, 225),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<File>('_image', _image));
  }
}
