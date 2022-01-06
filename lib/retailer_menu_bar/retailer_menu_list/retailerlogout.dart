import 'package:flutter/material.dart';

class RetailerLogout extends StatelessWidget {
  const RetailerLogout({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, 'retailerlogin');
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
                Navigator.pushNamed(context, 'retailerdrawer');
              },
            ),
          ],
        ),
      ),
    );
  }
}
