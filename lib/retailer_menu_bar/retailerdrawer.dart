//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firstproject/retailer_menu_bar/my_drawer_header_retailer.dart';
import 'package:firstproject/retailer_profile/page/profile_page.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailerhelp.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailerlogout.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailercart.dart';
import 'package:firstproject/retailer_menu_bar/retailer_menu_list/retailerhomepage.dart';

class RetailerDrawer extends StatefulWidget {
  const RetailerDrawer({Key? key}) : super(key: key);

  @override
  _RetailerDrawerState createState() => _RetailerDrawerState();
}

class _RetailerDrawerState extends State<RetailerDrawer> {
  var currentPage = DrawerSections.retailerhomepage;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.retailerhomepage) {
      container = const RetailerHomePage();
    } else if (currentPage == DrawerSections.profile_page) {
      container = ProfilePage();
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
          child: Container(
            child: Column(
              children: [
                const MyDrawerForRetailer(),
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
              currentPage == DrawerSections.profile_page ? true : false),
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
              currentPage = DrawerSections.profile_page;
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
  profile_page,
  retailercart,
  retailerhelp,
  retailerlogout,
}
