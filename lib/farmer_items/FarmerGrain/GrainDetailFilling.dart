import 'package:flutter/material.dart';
import 'package:firstproject/farmer_items/FarmerGrain/models/GrainModel.dart';

class GrainDetailFilling extends StatefulWidget {
  final Function(User) addUser;

  // ignore: use_key_in_widget_constructors
  const GrainDetailFilling(this.addUser);

  @override
  _GrainDetailFillingState createState() => _GrainDetailFillingState();
}

class _GrainDetailFillingState extends State<GrainDetailFilling> {
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

    var grainnameController = TextEditingController();
    var graindescController = TextEditingController();
    var grainpriceController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Grain Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.amberAccent,
              ),
            ),
            buildTextField('Grain Name', grainnameController),
            buildTextField('Grain Description', graindescController),
            buildTextField('Grain Price', grainpriceController),
            ElevatedButton(
              onPressed: () {
                final user = User(grainnameController.text,
                    graindescController.text, grainpriceController.text);
                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: const Text('Add Grain'),
            ),
          ],
        ),
      ),
    );
  }
}
