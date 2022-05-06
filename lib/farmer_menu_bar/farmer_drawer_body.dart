import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/farmer_login_and_SignUp/farmermodel/farmerusermodel.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/farmer_menu_bar/farmer_drawer_header.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/farmer_profile/page/farmer_profile.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/placedOrder.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/help.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/logout.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/homepage.dart';

class FarmerDrawerBody extends StatefulWidget {
  const FarmerDrawerBody({Key? key}) : super(key: key);

  @override
  _FarmerDrawerBodyState createState() => _FarmerDrawerBodyState();
}

class _FarmerDrawerBodyState extends State<FarmerDrawerBody> {
  User? user = FirebaseAuth.instance.currentUser;
  FarmerModel loggedInUser = FarmerModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("farmers")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = FarmerModel.fromMap(value.data());
      setState(() {});
    });
  }

  var currentPage = DrawerSections.homepage;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.homepage) {
      container = const FarmerHomePage();
    } else if (currentPage == DrawerSections.farmer_profile) {
      container = const FarmerProfilePage();
    } else if (currentPage == DrawerSections.placedOrder) {
      container = const PlacedOrder();
    } else if (currentPage == DrawerSections.help) {
      container = const Help();
    } else if (currentPage == DrawerSections.logout) {
      container = const LogOut();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[700],
        title: Text("Welcome ${loggedInUser.farmerfirstName}"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: [
                FarmerDrawerHeader(farmername: loggedInUser.farmerfirstName),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.dashboard_outlined,
              currentPage == DrawerSections.homepage ? true : false),
          menuItem(2, "Profile", Icons.people_alt_outlined,
              currentPage == DrawerSections.farmer_profile ? true : false),
          menuItem(3, "Placed Order", Icons.event,
              currentPage == DrawerSections.placedOrder ? true : false),
          menuItem(4, "Help", Icons.notes,
              currentPage == DrawerSections.help ? true : false),
          menuItem(5, "LogOut", Icons.notes,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.homepage;
            } else if (id == 2) {
              currentPage = DrawerSections.farmer_profile;
            } else if (id == 3) {
              currentPage = DrawerSections.placedOrder;
            } else if (id == 4) {
              currentPage = DrawerSections.help;
            } else if (id == 5) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  homepage,
  // ignore: constant_identifier_names
  farmer_profile,
  placedOrder,
  help,
  logout,
}
