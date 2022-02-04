// ignore: file_names
import 'package:flutter/material.dart';

class FarmerLogin extends StatefulWidget {
  const FarmerLogin({Key? key}) : super(key: key);

  @override
  _FarmerLoginState createState() => _FarmerLoginState();
}

class _FarmerLoginState extends State<FarmerLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/farmerLoginSignUp/Kissan_flutter.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome, Please Login Here !',
                style: TextStyle(color: Colors.black, fontSize: 28),
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
                              color: Colors.amberAccent,
                              fontSize: 27,
                              fontWeight: FontWeight.w700)),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.amber,
                          onPressed: () {
                            Navigator.pushNamed(context, 'farmer_drawer_body');
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
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text('SIGN UP',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 24,
                                color: Colors.lightBlueAccent,
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