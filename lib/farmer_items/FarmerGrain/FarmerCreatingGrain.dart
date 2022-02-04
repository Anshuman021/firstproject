import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerGrain/models/GrainModel.dart';
import 'package:firstproject/farmer_items/FarmerGrain/GrainDetailFilling.dart';

class FarmerCreatingGrain extends StatefulWidget {
  const FarmerCreatingGrain({Key? key}) : super(key: key);

  @override
  _FarmerCreatingGrainState createState() => _FarmerCreatingGrainState();
}

class _FarmerCreatingGrainState extends State<FarmerCreatingGrain> {
  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: GrainDetailFilling(addUserData),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Grain List'),
      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: const EdgeInsets.all(20),
              elevation: 16,
              child: ListTile(
                title: Text(
                  userList[index].grainname,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  userList[index].graindesc,
                  style: const TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  " ₹ " + userList[index].grainprice + " /Kg",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
          itemCount: userList.length,
        ),
      ),
    );
  }
}
