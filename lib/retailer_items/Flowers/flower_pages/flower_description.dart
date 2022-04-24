// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import 'package:firstproject/retailer_items/Flowers/flower_constant/flower_data.dart';
import 'package:firstproject/retailer_items/Flowers/flower_theme/flower_colors.dart';
// import 'package:like_button/like_button.dart';
import 'package:line_icons/line_icons.dart';

class FlowerDescription extends StatefulWidget {
  final int id;
  final String product;
  final String img;
  final String productdetail;
  final String pPrice;
  final String pPromotionPrice;
  // ignore: use_key_in_widget_constructors
  const FlowerDescription(
      {required this.id,
      required this.product,
      required this.img,
      required this.productdetail,
      required this.pPrice,
      required this.pPromotionPrice});
  @override
  _FlowerDescriptionState createState() => _FlowerDescriptionState();
}

class _FlowerDescriptionState extends State<FlowerDescription> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back_ios)),
            ),
          ),
          Hero(
            tag: widget.id.toString(),
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.img), fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Text(
                  "Product :",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.product,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Text(
                  "Product Detail :",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.productdetail,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.indigo),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Text(
                  "Price :",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      " ₹ " + widget.pPromotionPrice,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      " ₹ " + widget.pPrice,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: warning,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: <Widget>[
                const Text(
                  "Qty :",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if (qty > 1) {
                          setState(() {
                            qty = --qty;
                          });
                        }

                        // minus here
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle),
                        child: const Icon(
                          LineIcons.minus,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      qty.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          qty = ++qty;
                        });
                        // minus here
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle),
                        child: const Icon(
                          LineIcons.plus,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              // your add cart function here
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(30)),
                child: const Center(
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
