//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../retailer_menu_bar/Retailer_drawer_body.dart';

class RetailerLogin extends StatefulWidget {
  const RetailerLogin({Key? key}) : super(key: key);

  @override
  _RetailerLoginState createState() => _RetailerLoginState();
}

class _RetailerLoginState extends State<RetailerLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _otpController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  // Declare the object
  // late EmailAuth emailAuth;

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    // emailAuth = EmailAuth(
    //   sessionName: "OTP for Retailer",
    // );
  }

  // void sendOtp() async {
  //   //EmailAuth emailAuth = EmailAuth(sessionName: "Testing session");
  //   var res = await emailAuth.sendOtp(
  //       recipientMail: _emailController.value.text, otpLength: 4);
  //   if (res) {
  //     // print("OTP sent");
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return CupertinoAlertDialog(
  //             title: const Text("OTP Sent Successfully !"),
  //             actions: [
  //               CupertinoDialogAction(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               ),
  //             ],
  //           );
  //         });
  //   } else {
  //     // print("otp not sent");
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return CupertinoAlertDialog(
  //             title: const Text("OTP Not sent"),
  //             content: const Text(
  //                 "Error due to the Invalid Email please re-enter email"),
  //             actions: [
  //               CupertinoDialogAction(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               ),
  //             ],
  //           );
  //         });
  //   }
  // }

  // void verifyOTP() {
  //   var res = emailAuth.validateOtp(
  //       recipientMail: _emailController.value.text,
  //       userOtp: _otpController.text);
  //   if (res) {
  //     // print("OTP verified");
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return CupertinoAlertDialog(
  //             title: const Text("OTP Verified"),
  //             actions: [
  //               CupertinoDialogAction(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               ),
  //             ],
  //           );
  //         });
  //   } else {
  //     // print("NOT valid otp");

  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return CupertinoAlertDialog(
  //             title: const Text("OTP"),
  //             content: const Text("Incorrect OTP"),
  //             actions: [
  //               CupertinoDialogAction(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text("OK"),
  //               ),
  //             ],
  //           );
  //         });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/RetailerLoginSIgnUp/login_retailer.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Please Login Here!',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 35,
                  left: 35),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      autocorrect: true,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter The Email Address";
                        }

                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            .hasMatch(val)) {
                          return "Incorrect Email";
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.lightBlue.shade100,
                          filled: true,
                          hintText: "Email",
                          // suffixIcon: TextButton(
                          //   child: const Text("send OTP"),
                          //   onPressed: () => sendOtp(),
                          // ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // TextFormField(
                    //   controller: _otpController,
                    //   keyboardType: TextInputType.number,
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //       fillColor: Colors.lightBlue.shade100,
                    //       filled: true,
                    //       hintText: "Enter OTP",
                    //       suffixIcon: TextButton(
                    //         child: const Text("Verify OTP"),
                    //         onPressed: () => verifyOTP(),
                    //       ),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10))),
                    //   validator: (val) {
                    //     if (val!.isEmpty) {
                    //       return "Please Enter The OTP";
                    //     }
                    //     if (val.length < 6) {
                    //       return "Enter 6 Digit OTP and verify";
                    //     }

                    //     if (val.length > 6) {
                    //       return "Enter 6 Digit OTP and verify";
                    //     }
                    //   },
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.lightBlue.shade100,
                          filled: true,
                          hintText: "Password",
                          helperText: "Include !@# for strong password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('SIGN IN',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 27,
                                fontWeight: FontWeight.w700)),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.purpleAccent,
                            onPressed: () {
                              signIn(_emailController.text,
                                  _passwordController.text);
                              // if (_formkey.currentState!.validate()) {
                              //   Navigator.pushNamed(
                              //       context, 'Retailer_drawer_body');
                              // }
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
                                  color: Colors.black,
                                )))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RetailerDrawerBody())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
