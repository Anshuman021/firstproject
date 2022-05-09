//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/retailer_login_signup/retailermodel/retailerusermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

import '../retailer_menu_bar/Retailer_drawer_body.dart';

class RetailerSignUp extends StatefulWidget {
  const RetailerSignUp({Key? key}) : super(key: key);

  @override
  _RetailerSignUpState createState() => _RetailerSignUpState();
}

class _RetailerSignUpState extends State<RetailerSignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  TextEditingController phoneotpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  final _formkey = GlobalKey<FormState>();
  late EmailAuth emailAuth;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationID = "";
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
    // print(_emailController.value.text);
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
                style: TextStyle(color: Colors.black, fontSize: 22),
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
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                controller: _nameController,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 22),
                                decoration: InputDecoration(
                                    fillColor: Colors.lime.shade100,
                                    filled: true,
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
                                    hintText: "Enter Name",
                                    hintStyle: const TextStyle(
                                      color: Colors.purpleAccent,
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
                                  color: Colors.black, fontSize: 22),
                              decoration: InputDecoration(
                                  fillColor: Colors.lime.shade100,
                                  filled: true,
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
                                  hintText: "Enter Email",
                                  hintStyle: const TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 18,
                                  ),
                                  suffixIcon: TextButton(
                                    child: const Text("send OTP"),
                                    onPressed: () => sendOtp(),
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
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.lime.shade100,
                                  filled: true,
                                  hintText: "Enter OTP",
                                  hintStyle: const TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 18,
                                  ),
                                  suffixIcon: TextButton(
                                    child: const Text("verify otp"),
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
                              height: 30,
                            ),
                            TextFormField(
                                controller: _phonenoController,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 26),
                                decoration: InputDecoration(
                                    fillColor: Colors.lime.shade100,
                                    filled: true,
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
                                      color: Colors.purpleAccent,
                                      fontSize: 18,
                                    ),
                                    suffixIcon: TextButton(
                                      child: const Text("verify mobile no"),
                                      onPressed: () => verifymobileno(),
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
                              controller: phoneotpController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22),
                              decoration: InputDecoration(
                                  fillColor: Colors.lime.shade100,
                                  filled: true,
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
                                  hintText: "otp for mobile",
                                  hintStyle: const TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 18,
                                  ),
                                  suffixIcon: TextButton(
                                    child: const Text("verify otp"),
                                    onPressed: () => verifymobileOTP(),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please Enter the otp";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.lime.shade100,
                                  filled: true,
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
                                  hintText: "Enter Password",
                                  hintStyle: const TextStyle(
                                    color: Colors.purpleAccent,
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
                            TextFormField(
                              controller: _confirmpasswordController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.lime.shade100,
                                  filled: true,
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
                                  hintText: "confirm password",
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
                                if (_confirmpasswordController.text !=
                                    _passwordController.text) {
                                  return "Password don't match";
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
                                        color: Colors.amberAccent,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700)),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.amberAccent,
                                    onPressed: () {
                                      signUp(_emailController.text,
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
                                    Navigator.pushNamed(
                                        context, 'retailerlogin');
                                  },
                                  child: const Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.deepPurpleAccent,
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

  void verifymobileno() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91" + _phonenoController.text.toString().trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("Phone number verified");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifymobileOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: phoneotpController.text);

    await auth.signInWithCredential(credential).then((value) {
      print("Phone no verified");
      Fluttertoast.showToast(
          msg: "Phone no verified",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? retailerdata = _auth.currentUser;

    RetailerModel retaileruserModel = RetailerModel();

    // writing all the values
    retaileruserModel.ruid = retailerdata!.uid;
    retaileruserModel.retailerfirstName = _nameController.text;
    retaileruserModel.retaileremail = retailerdata.email;
    retaileruserModel.retailerphoneno = _phonenoController.text;
    retaileruserModel.retailerpassword = _passwordController.text;
    retaileruserModel.retailerPhotoURL =
        "https://cdn0.iconfinder.com/data/icons/messenger/154/avatar-login-human-man-user-sign-label-512.png";

    await firebaseFirestore
        .collection("retailers")
        .doc(retailerdata.uid)
        .set(retaileruserModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushReplacement(
      (context),
      MaterialPageRoute(builder: (context) => const RetailerDrawerBody()),
    );
  }
}
