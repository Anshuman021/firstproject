import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/retailer_login_signup/retailermodel/retailerusermodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';

class FruitList extends StatefulWidget {
  const FruitList({Key? key}) : super(key: key);

  @override
  State<FruitList> createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  String FruitQuantity = "1";
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

  //FruitCart for particular user

  Future fruitAddToCart(String fruitName, String fruitPrice,
      String fruitImageUrl, String fruitQuantity) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("retailers")
        .doc(loggedInUser.ruid)
        .collection("YourCart")
        .doc(fruitName)
        .set({
      "ProductName": fruitName,
      "ProductPrice": fruitPrice,
      "ProductImageUrl": fruitImageUrl,
      "ProductQuantity": fruitQuantity,
      "UpdatedProductPrice": fruitPrice
    }).whenComplete(() => Fluttertoast.showToast(
            msg: "Item Added To Cart :) ", textColor: Colors.greenAccent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fruit List")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("FruitList").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Something Went Wrong!"),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  QueryDocumentSnapshot<Object?>? documentSnapshot =
                      snapshot.data?.docs[index];
                  return Dismissible(
                      key: Key(index.toString()),
                      child: Card(
                        color: const Color.fromARGB(255, 224, 230, 191),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        elevation: 20,
                        shadowColor: const Color.fromARGB(255, 123, 132, 51),
                        margin:
                            const EdgeInsets.fromLTRB(14.0, 19.0, 14.0, 12.0),
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
                                      height: 100.0,
                                      width: 98.0,
                                      child: CircleAvatar(
                                        radius: 100,
                                        backgroundColor:
                                            const Color.fromARGB(255, 0, 0, 0),
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
                                    const SizedBox(
                                      width: 34,
                                    ),
                                    Container(
                                        height: 100,
                                        width: 200,
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
                                                    255, 54, 32, 18)),
                                            textAlign: TextAlign.justify,
                                          ),
                                        )),
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
                                          fontSize: 16, color: Colors.green),
                                    ),
                                    const Spacer(),
                                    const LikeButton(
                                      size: 28,
                                    ),
                                    Container(
                                      child: IconButton(
                                        icon: const Icon(
                                            Icons.shopping_bag_sharp),
                                        iconSize: 40,
                                        color: Color.fromARGB(255, 73, 60, 23),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(140, 30),
                                            side: const BorderSide(
                                                width: 2, color: Colors.black),
                                            textStyle:
                                                const TextStyle(fontSize: 18)),
                                        child: const Text("Add To Cart"),
                                        onPressed: () {
                                          fruitAddToCart(
                                              documentSnapshot["fruitName"],
                                              documentSnapshot["fruitPrice"],
                                              documentSnapshot["fruitImgUrl"],
                                              FruitQuantity);
                                        },
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
        },
      ),
    );
  }
}
