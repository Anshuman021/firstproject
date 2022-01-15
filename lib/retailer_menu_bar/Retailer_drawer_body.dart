//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firstproject/retailer_menu_bar/Retailer_drawer_header.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailer_profile/page/retailer_profile.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailerhelp.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailerlogout.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailercart.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailerhomepage.dart';

class RetailerDrawerBody extends StatefulWidget {
  const RetailerDrawerBody({Key? key}) : super(key: key);

  @override
  _RetailerDrawerBodyState createState() => _RetailerDrawerBodyState();
}

class _RetailerDrawerBodyState extends State<RetailerDrawerBody> {
  var currentPage = DrawerSections.retailerhomepage;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.retailerhomepage) {
      container = const RetailerHomePage();
    } else if (currentPage == DrawerSections.retailer_profile) {
      container = const RetailerProfilePage();
    } else if (currentPage == DrawerSections.retailercart) {
      container = const RetailerCart();
    } else if (currentPage == DrawerSections.retailerhelp) {
      container = const RetailerHelp();
    } else if (currentPage == DrawerSections.retailerlogout) {
      container = const RetailerLogout();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[700],
        title: const Text("Retailer Page"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: [
                const RetailerDrawerHeader(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Text("Service for Retailer"),
        color: Colors.amberAccent,
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
              currentPage == DrawerSections.retailerhomepage ? true : false),
          menuItem(2, "Profile", Icons.people_alt_outlined,
              currentPage == DrawerSections.retailer_profile ? true : false),
          menuItem(3, "Cart Option", Icons.event,
              currentPage == DrawerSections.retailercart ? true : false),
          menuItem(4, "Help", Icons.notes,
              currentPage == DrawerSections.retailerhelp ? true : false),
          menuItem(5, "LogOut", Icons.notes,
              currentPage == DrawerSections.retailerlogout ? true : false),
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
              currentPage = DrawerSections.retailerhomepage;
            } else if (id == 2) {
              currentPage = DrawerSections.retailer_profile;
            } else if (id == 3) {
              currentPage = DrawerSections.retailercart;
            } else if (id == 4) {
              currentPage = DrawerSections.retailerhelp;
            } else if (id == 5) {
              currentPage = DrawerSections.retailerlogout;
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
  retailerhomepage,
  // ignore: constant_identifier_names
  retailer_profile,
  retailercart,
  retailerhelp,
  retailerlogout,
}
