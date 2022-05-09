// import 'package:flutter/material.dart';

// class RetailerCart extends StatefulWidget {
//   const RetailerCart({Key? key}) : super(key: key);

//   @override
//   State<RetailerCart> createState() => _RetailerCartState();
// }

// class _RetailerCartState extends State<RetailerCart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/retailer_login_signup/retailermodel/retailerusermodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RetailerCart extends StatefulWidget {
  const RetailerCart({Key? key}) : super(key: key);

  @override
  State<RetailerCart> createState() => _RetailerCartState();
}

class _RetailerCartState extends State<RetailerCart> {
  User? user = FirebaseAuth.instance.currentUser;
  RetailerModel loggedInUser = RetailerModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("retailers")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = RetailerModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Your Cart List")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("retailers")
            .doc(loggedInUser.ruid)
            .collection("YourCart")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Loading ...\nWait for a while!"),
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
                        shadowColor: const Color.fromARGB(255, 157, 77, 42),
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
                                            ? (documentSnapshot["ProductName"])
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
                                                        "ProductImageUrl"] ==
                                                    null))
                                                ? const Center(
                                                    child: Text("No Image"),
                                                  )
                                                : Image.network(
                                                    (documentSnapshot[
                                                        "ProductImageUrl"]),
                                                    fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      child: Text(
                                        (documentSnapshot != null)
                                            ? ((documentSnapshot[
                                                        "UpdatedProductPrice"] !=
                                                    null)
                                                ? "₹ " +
                                                    documentSnapshot[
                                                        "UpdatedProductPrice"] +
                                                    " /Kg"
                                                : "")
                                            : "",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.green),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      child: Text(
                                        (documentSnapshot != null)
                                            ? ((documentSnapshot[
                                                        "ProductQuantity"] !=
                                                    null)
                                                ? "Quantity: " +
                                                    documentSnapshot[
                                                        "ProductQuantity"]
                                                : "")
                                            : "",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 231, 89, 89)),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1.0, bottom: 1.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                      child: IconButton(
                                        icon: const Icon(Icons.delete),
                                        iconSize: 36,
                                        color: const Color.fromARGB(
                                            255, 240, 97, 78),
                                        onPressed: () {
                                          deleteProduct(
                                              documentSnapshot["ProductName"]);
                                        },
                                      ),
                                    ),
                                    // const Spacer(),
                                    // Text(
                                    //   (documentSnapshot != null)
                                    //       ? ((documentSnapshot[
                                    //                   "ProductQuantity"] !=
                                    //               null)
                                    //           ? documentSnapshot[
                                    //               "ProductQuantity"]
                                    //           : "")
                                    //       : "",
                                    //   style: const TextStyle(
                                    //       fontSize: 18, color: Colors.green),
                                    // ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color.fromARGB(
                                                255, 244, 124, 54)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 32,
                                        // color: Color.fromARGB(255, 240, 97, 78),
                                        color: Colors.deepPurple,
                                        highlightColor: const Color.fromARGB(
                                            255, 241, 162, 156),
                                        splashColor: Colors.blue,
                                        onPressed: () {
                                          // addprodquant(
                                          //     documentSnapshot[
                                          //         "ProductImageUrl"],
                                          //     documentSnapshot["ProductName"],
                                          //     documentSnapshot["ProductPrice"],
                                          //     documentSnapshot[
                                          //         "ProductQuantity"]);
                                          int? quant = int.parse(
                                              documentSnapshot[
                                                  "ProductQuantity"]);
                                          int? price = int.parse(
                                              documentSnapshot["ProductPrice"]);
                                          int initprice = int.parse(
                                              documentSnapshot[
                                                  "UpdatedProductPrice"]);
                                          quant++;
                                          int updprice = (price + initprice);
                                          String quantity = quant.toString();
                                          String itemprice =
                                              updprice.toString();
                                          String oldprice = price.toString();

                                          quantityUpdate(
                                              documentSnapshot[
                                                  "ProductImageUrl"],
                                              documentSnapshot["ProductName"],
                                              oldprice,
                                              quantity,
                                              itemprice);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(100, 33),
                                            side: const BorderSide(
                                                width: 2, color: Colors.black),
                                            textStyle:
                                                const TextStyle(fontSize: 18)),
                                        child: const Text("Buy"),
                                        onPressed: () {
                                          // fruitAddToCart(
                                          //     documentSnapshot["fruitName"],
                                          //     documentSnapshot["fruitPrice"],
                                          //     documentSnapshot["fruitImgUrl"]);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color.fromARGB(
                                                255, 17, 90, 185)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.remove),
                                        iconSize: 32,
                                        // color: const Color.fromARGB(
                                        //     255, 240, 97, 78),
                                        color: Colors.deepOrange,
                                        highlightColor: const Color.fromARGB(
                                            255, 241, 162, 156),
                                        splashColor: Colors.blue,
                                        onPressed: () {
                                          int updprice;
                                          int? quant = int.parse(
                                              documentSnapshot[
                                                  "ProductQuantity"]);
                                          int? price = int.parse(
                                              documentSnapshot["ProductPrice"]);
                                          int initprice = int.parse(
                                              documentSnapshot[
                                                  "UpdatedProductPrice"]);
                                          quant--;
                                          if (quant <= 0) {
                                            quant = 1;
                                            updprice = price;
                                            Fluttertoast.showToast(
                                                msg: "Item Can't be zero",
                                                textColor: Colors.redAccent);
                                          } else {
                                            updprice = (initprice - price);
                                          }
                                          String itemprice =
                                              updprice.toString();
                                          String quantity = quant.toString();

                                          String oldprice = price.toString();

                                          quantityUpdate(
                                              documentSnapshot[
                                                  "ProductImageUrl"],
                                              documentSnapshot["ProductName"],
                                              oldprice,
                                              quantity,
                                              itemprice);
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

  //Product Quantity Upadate for every particular user

  Future quantityUpdate(String prodImgUrl, String prodName, String prodPrice,
      String prodQuant, String updatedprice) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection("retailers")
        .doc(loggedInUser.ruid)
        .collection("YourCart")
        .doc(prodName)
        .set({
      "ProductImageUrl": prodImgUrl,
      "ProductName": prodName,
      "ProductPrice": prodPrice,
      "ProductQuantity": prodQuant,
      "UpdatedProductPrice": updatedprice
    });
  }

  deleteProduct(item) {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("retailers")
        .doc(loggedInUser.ruid)
        .collection("YourCart")
        .doc(item);

    documentReference.delete().whenComplete(() => Fluttertoast.showToast(
        msg: "Item Removed", textColor: Colors.redAccent));
  }
}
