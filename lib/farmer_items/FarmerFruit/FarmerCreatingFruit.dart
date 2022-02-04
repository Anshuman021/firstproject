import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerFruit/models/FruitModel.dart';
import 'package:firstproject/farmer_items/FarmerFruit/FruitDetailFilling.dart';

class FarmerCreatingFruit extends StatefulWidget {
  const FarmerCreatingFruit({Key? key}) : super(key: key);

  @override
  _FarmerCreatingFruitState createState() => _FarmerCreatingFruitState();
}

class _FarmerCreatingFruitState extends State<FarmerCreatingFruit> {
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
            content: FruitDetailFilling(addUserData),
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
        title: const Text('Fruit List'),
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
                  userList[index].fruitname,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  userList[index].fruitdesc,
                  style: const TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  " ₹ " + userList[index].fruitprice + " /Kg",
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
