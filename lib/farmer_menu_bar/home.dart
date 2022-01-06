import 'package:flutter/material.dart';
import 'package:firstproject/farmer_menu_bar/my_drawer_header.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/profile.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/placedOrder.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/help.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/logout.dart';
import 'package:firstproject/farmer_menu_bar/farmer_menu_list/homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = DrawerSections.homepage;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.homepage) {
      container = const FarmerHomePage();
    } else if (currentPage == DrawerSections.profile) {
      container = const Profile();
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
        title: const Text("Farmer Page"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
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
              currentPage == DrawerSections.homepage ? true : false),
          menuItem(2, "Profile", Icons.people_alt_outlined,
              currentPage == DrawerSections.profile ? true : false),
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
              currentPage = DrawerSections.profile;
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
  profile,
  placedOrder,
  help,
  logout,
}
