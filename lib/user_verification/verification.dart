import 'package:flutter/material.dart';

class VerifyingUser extends StatelessWidget {
  const VerifyingUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register As a ?"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text("As a Farmer"),
              color: Colors.lightBlueAccent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            RaisedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text("As a Retailer"),
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.pushNamed(context, 'retailersignup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
