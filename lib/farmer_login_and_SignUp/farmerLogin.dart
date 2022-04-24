// ignore: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';

class FarmerLogin extends StatefulWidget {
  const FarmerLogin({Key? key}) : super(key: key);

  @override
  _FarmerLoginState createState() => _FarmerLoginState();
}

class _FarmerLoginState extends State<FarmerLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  late EmailAuth emailAuth;
  @override
  void initState() {
    super.initState();

    emailAuth = EmailAuth(
      sessionName: "OTP for Retailer",
    );
  }

  void sendOtp() async {
    //EmailAuth emailAuth = EmailAuth(sessionName: "Testing session");
    var res = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 4);
    if (res) {
      // print("OTP sent");
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text("OTP Sent Successfully !"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
    } else {
      // print("otp not sent");
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text("OTP Not sent"),
              content: const Text(
                  "Error due to the Invalid Email please re-enter email"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
    }
  }

  void verifyOTP() {
    var res = emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _otpController.text);
    if (res) {
      // print("OTP verified");
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text("OTP Verified"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
    } else {
      // print("NOT valid otp");

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text("OTP"),
              content: const Text("Incorrect OTP"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          });
    }
  }

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
                style: TextStyle(color: Colors.black, fontSize: 24),
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
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          suffixIcon: TextButton(
                            child: const Text("send OTP"),
                            onPressed: () => sendOtp(),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Enter OTP",
                          suffixIcon: TextButton(
                            child: const Text("Verify OTP"),
                            onPressed: () => verifyOTP(),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter The OTP";
                        }
                        if (val.length < 6) {
                          return "Enter 6 Digit OTP and verify";
                        }

                        if (val.length > 6) {
                          return "Enter 6 Digit OTP and verify";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Password",
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
                              if (_formkey.currentState!.validate()) {
                                Navigator.pushNamed(
                                    context, 'farmer_drawer_body');
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
                              Navigator.pushNamed(context, 'register');
                            },
                            child: const Text('SIGN UP',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 24,
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
}
