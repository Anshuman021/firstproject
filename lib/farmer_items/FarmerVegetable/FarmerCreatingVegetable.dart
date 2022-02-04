import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerVegetable/models/VegetableModel.dart';
import 'package:firstproject/farmer_items/FarmerVegetable/VegetableDetailFilling.dart';

class FarmerCreatingVegetable extends StatefulWidget {
  const FarmerCreatingVegetable({Key? key}) : super(key: key);

  @override
  _FarmerCreatingVegetableState createState() =>
      _FarmerCreatingVegetableState();
}

class _FarmerCreatingVegetableState extends State<FarmerCreatingVegetable> {
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
            content: VegetableDetailFilling(addUserData),
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
        title: const Text('Vegetable List'),
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
                  userList[index].vegetablename,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  userList[index].vegetabledesc,
                  style: const TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  " ₹ " + userList[index].vegetableprice + " /Kg",
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
