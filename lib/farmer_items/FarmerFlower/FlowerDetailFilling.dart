import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerFlower/models/FlowerModel.dart';

class FlowerDetailFilling extends StatefulWidget {
  final Function(User) addUser;

  // ignore: use_key_in_widget_constructors
  const FlowerDetailFilling(this.addUser);

  @override
  _FlowerDetailFillingState createState() => _FlowerDetailFillingState();
}

class _FlowerDetailFillingState extends State<FlowerDetailFilling> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: const EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    var flowernameController = TextEditingController();
    var flowerdescController = TextEditingController();
    var flowerpriceController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Flower Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.lightBlueAccent,
              ),
            ),
            buildTextField('Flower Name', flowernameController),
            buildTextField('Flower Description', flowerdescController),
            buildTextField('Flower Price', flowerpriceController),
            ElevatedButton(
              onPressed: () {
                final user = User(flowernameController.text,
                    flowerdescController.text, flowerpriceController.text);
                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: const Text('Add Flower'),
            ),
          ],
        ),
      ),
    );
  }
}
