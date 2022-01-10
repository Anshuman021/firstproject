import 'package:flutter/material.dart';

class MyDrawerForRetailer extends StatefulWidget {
  const MyDrawerForRetailer({Key? key}) : super(key: key);

  @override
  _MyDrawerForRetailerState createState() => _MyDrawerForRetailerState();
}

class _MyDrawerForRetailerState extends State<MyDrawerForRetailer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[500],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 100,
          ),
          const Text(
            "Retailer profile",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
