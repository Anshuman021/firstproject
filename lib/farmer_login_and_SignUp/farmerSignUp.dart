//import 'dart:html';

// import 'package:firstproject/retailer_items/Flowers/flower_theme/flower_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmermodel/farmerusermodel.dart';
import 'package:firstproject/farmer_menu_bar/farmer_drawer_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FarmerSignUp extends StatefulWidget {
  const FarmerSignUp({Key? key}) : super(key: key);

  @override
  _FarmerSignUpState createState() => _FarmerSignUpState();
}

class _FarmerSignUpState extends State<FarmerSignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenoController = TextEditingController();
  TextEditingController phoneotpController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

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
              image: AssetImage('assets/farmerLoginSignUp/farmer_signup.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40, top: 120),
              child: const Text(
                'Create Your Account Here!',
                style: TextStyle(color: Colors.black, fontSize: 20),
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
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                controller: _nameController,
                                style: const TextStyle(
                                    color: Colors.blueAccent, fontSize: 22),
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
                                    hintText: "Name",
                                    hintStyle: const TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                  color: Colors.blueAccent, fontSize: 22),
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
                                  hintText: "Email",
                                  suffixIcon: TextButton(
                                    child: const Text("send OTP"),
                                    onPressed: () => sendOtp(),
                                  ),
                                  hintStyle: const TextStyle(
                                      color: Colors.black, fontSize: 20),
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
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
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
                              height: 30,
                            ),
                            TextFormField(
                                controller: _phonenoController,
                                style: const TextStyle(
                                    color: Colors.blueAccent, fontSize: 22),
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
                                        color: Colors.black, fontSize: 20),
                                    suffixIcon: TextButton(
                                      child: const Text("verify"),
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
                                  hintText: "Enter OTP",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
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
                                  color: Colors.blueAccent, fontSize: 22),
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
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                      color: Colors.black, fontSize: 20),
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
                                        color: Colors.yellow,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700)),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.yellow,
                                    onPressed: () {
                                      // if (_formkey.currentState!.validate()) {
                                      //   Navigator.pushNamed(
                                      //       context, 'farmer_drawer_body');
                                      // }

                                      signUp(_emailController.text,
                                          _passwordController.text);
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
                                    Navigator.pushNamed(context, 'farmerLogin');
                                  },
                                  child: const Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
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
    User? farmerdata = _auth.currentUser;

    FarmerModel farmeruserModel = FarmerModel();

    // writing all the values
    farmeruserModel.fuid = farmerdata!.uid;
    farmeruserModel.farmerfirstName = _nameController.text;
    farmeruserModel.farmeremail = farmerdata.email;
    farmeruserModel.farmerphoneno = _phonenoController.text;
    farmeruserModel.farmerpassword = _passwordController.text;
    farmeruserModel.farmerPhotoURL =
        "https://tse1.mm.bing.net/th?id=OIP.iPT2f-NkI6nwmeMnV_YazAHaHa&pid=Api&P=0&w=175&h=175";

    await firebaseFirestore
        .collection("farmers")
        .doc(farmerdata.uid)
        .set(farmeruserModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushReplacement(
      (context),
      MaterialPageRoute(builder: (context) => const FarmerDrawerBody()),
    );
  }
}
