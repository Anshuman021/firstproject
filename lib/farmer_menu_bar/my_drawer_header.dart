import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/Profile.jpg'),
              ),
            ),
          ),
          const Text(
            "Farmer Profile",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          // Text(
          //   "info@rapidtech.dev",
          //   style: TextStyle(
          //     color: Colors.grey[200],
          //     fontSize: 14,
          //   ),
          // ),
        ],
      ),
    );
  }
}
