import 'package:flutter/material.dart';

class RetailerLogin extends StatefulWidget {
  const RetailerLogin({Key? key}) : super(key: key);

  @override
  _RetailerLoginState createState() => _RetailerLoginState();
}

class _RetailerLoginState extends State<RetailerLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
                style: TextStyle(color: Colors.black, fontSize: 34),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
}
