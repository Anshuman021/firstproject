//import 'dart:html';

import 'package:flutter/material.dart';

class RetailerSignUp extends StatefulWidget {
  const RetailerSignUp({Key? key}) : super(key: key);

  @override
  _RetailerSignUpState createState() => _RetailerSignUpState();
}

class _RetailerSignUpState extends State<RetailerSignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phonenoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'assets/RetailerLoginSIgnUp/Kissan_flutter_02.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Create Your Account Here!',
                style: TextStyle(color: Colors.black, fontSize: 29),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                controller: _nameController,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 22),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.pink,
                                      ),
                                    ),
                                    hintText: "Name",
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter Your Name";
                                  }
                                  if (!RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
                                    return "Please Enter Correct Name";
                                  }
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _emailController,
                              style: const TextStyle(
                                  color: Colors.amberAccent, fontSize: 22),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black54),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.pink,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter The Email Address";
                                }

                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(val)) {
                                  return "Incorrect Email";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                controller: _phonenoController,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 26),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.pink,
                                      ),
                                    ),
                                    hintText: "Phone Number",
                                    hintStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please Enter Your Phone No";
                                  }
                                  if (val.length != 10) {
                                    return "Incorrect Phone No";
                                  }
                                  if (!RegExp(
                                          r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                      .hasMatch(val)) {
                                    return "Please Enter Correct Phone No";
                                  }
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _addressController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.pink,
                                    ),
                                  ),
                                  hintText: "Address",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter The Address";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(
                                  color: Colors.amberAccent, fontSize: 22),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.pink,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter the Password";
                                }
                                if (val.length < 5) {
                                  return "Enter Atleast 5 Character";
                                }
                                if (val.contains("@") ||
                                    val.contains("#") ||
                                    val.contains("*")) {
                                  return null;
                                } else {
                                  return "One Special Character Needed";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700)),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.amber,
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        Navigator.pushNamed(
                                            context, 'Retailer_drawer_body');
                                      }
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
                                    Navigator.pushNamed(
                                        context, 'retailerlogin');
                                  },
                                  child: const Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 26,
                                    ),
                                  ),
                                  style: const ButtonStyle(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
