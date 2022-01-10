import 'package:flutter/material.dart';

class RetailerLogin extends StatefulWidget {
  const RetailerLogin({Key? key}) : super(key: key);

  @override
  _RetailerLoginState createState() => _RetailerLoginState();
}

class _RetailerLoginState extends State<RetailerLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/RetailerLoginSIgnUp/retailer_login.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Please Login Here!',
                style: TextStyle(color: Colors.black, fontSize: 34),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('SIGN IN',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 27,
                              fontWeight: FontWeight.w700)),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.yellow,
                          onPressed: () {
                            Navigator.pushNamed(context, 'retailerdrawer');
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'retailersignup');
                          },
                          child: const Text('SIGN UP',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 25,
                                color: Colors.greenAccent,
                              )))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
