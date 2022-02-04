import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerFruit/models/FruitModel.dart';

class FruitDetailFilling extends StatefulWidget {
  final Function(User) addUser;

  // ignore: use_key_in_widget_constructors
  const FruitDetailFilling(this.addUser);

  @override
  _FruitDetailFillingState createState() => _FruitDetailFillingState();
}

class _FruitDetailFillingState extends State<FruitDetailFilling> {
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

    var fruitnameController = TextEditingController();
    var fruitdescController = TextEditingController();
    var fruitpriceController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Fruit Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.purpleAccent,
              ),
            ),
            buildTextField('Fruit Name', fruitnameController),
            buildTextField('Fruit Description', fruitdescController),
            buildTextField('Fruit Price', fruitpriceController),
            ElevatedButton(
              onPressed: () {
                final user = User(fruitnameController.text,
                    fruitdescController.text, fruitpriceController.text);
                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: const Text('Add Fruit'),
            ),
          ],
        ),
      ),
    );
  }
}
