import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerFlower/models/FlowerModel.dart';
import 'package:firstproject/farmer_items/FarmerFlower/FlowerDetailFilling.dart';

class FarmerCreatingFlower extends StatefulWidget {
  const FarmerCreatingFlower({Key? key}) : super(key: key);

  @override
  _FarmerCreatingFlowerState createState() => _FarmerCreatingFlowerState();
}

class _FarmerCreatingFlowerState extends State<FarmerCreatingFlower> {
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
            content: FlowerDetailFilling(addUserData),
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
        title: const Text('Flower List'),
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
                  userList[index].flowername,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  userList[index].flowerdesc,
                  style: const TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  " ₹ " + userList[index].flowerprice,
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
