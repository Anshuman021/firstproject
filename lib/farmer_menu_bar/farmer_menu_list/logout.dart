// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firstproject/farmer_login_and_SignUp/farmerLogin.dart';
import 'package:firstproject/farmer_menu_bar/farmer_drawer_body.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[300],
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton.icon(
              icon: const Icon(Icons.outbox),
              label: const Text("Yes"),
              color: Colors.redAccent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              onPressed: () {
                // if (Platform.isAndroid) {
                //   //SystemNavigator.pop();
                //   exit(0);
                // }
                Navigator.pushReplacement(
                  (context),
                  MaterialPageRoute(builder: (context) => const FarmerLogin()),
                );

                // else {
                //   exit(0);
                // }
                //Navigator.pushNamed(context, 'retailerlogin');
              },
            ),
            const SizedBox(
              height: 30,
              width: 30,
            ),
            RaisedButton.icon(
              icon: const Icon(Icons.no_accounts),
              label: const Text("No"),
              color: Colors.lightGreen,
              onPressed: () {
                Navigator.pushReplacement(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => const FarmerDrawerBody()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
