import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerVegetable/models/VegetableModel.dart';

class VegetableDetailFilling extends StatefulWidget {
  final Function(User) addUser;

  // ignore: use_key_in_widget_constructors
  const VegetableDetailFilling(this.addUser);

  @override
  _VegetableDetailFillingState createState() => _VegetableDetailFillingState();
}

class _VegetableDetailFillingState extends State<VegetableDetailFilling> {
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

    var vegetablenameController = TextEditingController();
    var vegetabledescController = TextEditingController();
    var vegetablepriceController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Vegetable Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.orangeAccent,
              ),
            ),
            buildTextField('Vegetable Name', vegetablenameController),
            buildTextField('Vegetable Description', vegetabledescController),
            buildTextField('Vegetable Price', vegetablepriceController),
            ElevatedButton(
              onPressed: () {
                final user = User(
                    vegetablenameController.text,
                    vegetabledescController.text,
                    vegetablepriceController.text);
                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: const Text('Add Vegetable'),
            ),
          ],
        ),
      ),
    );
  }
}
