import 'package:flutter/material.dart';

class FarmerDrawerHeader extends StatefulWidget {
  String? farmername;
  FarmerDrawerHeader({Key? key, this.farmername}) : super(key: key);

  @override
  _FarmerDrawerHeaderState createState() => _FarmerDrawerHeaderState();
}

class _FarmerDrawerHeaderState extends State<FarmerDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[400],
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
            "${widget.farmername} Profile",
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
