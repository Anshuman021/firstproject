// ignore: file_names
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PlacedOrder extends StatelessWidget {
  const PlacedOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 230, 243),
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText("No",
                textStyle:
                    const TextStyle(fontSize: 30, color: Colors.blueAccent),
                speed: const Duration(milliseconds: 100)),
            TypewriterAnimatedText("Orders",
                textStyle:
                    const TextStyle(fontSize: 30, color: Colors.blueAccent),
                speed: const Duration(milliseconds: 80)),
            TypewriterAnimatedText("Placed! 🙂",
                textStyle:
                    const TextStyle(fontSize: 30, color: Colors.blueAccent),
                speed: const Duration(milliseconds: 70)),
          ],
        ),
      ),
    );
  }
}
