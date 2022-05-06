// ignore: file_names
import 'package:flutter/material.dart';

class RetailerDrawerHeader extends StatefulWidget {
  String? retailername;
  RetailerDrawerHeader({Key? key, this.retailername}) : super(key: key);

  @override
  _RetailerDrawerHeaderState createState() => _RetailerDrawerHeaderState();
}

class _RetailerDrawerHeaderState extends State<RetailerDrawerHeader> {
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
          Text(
            "${widget.retailername} Profile",
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
