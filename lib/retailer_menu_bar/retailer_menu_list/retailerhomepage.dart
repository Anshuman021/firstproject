import 'package:flutter/material.dart';

class RetailerHomePage extends StatelessWidget {
  const RetailerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.grey[300],
            body: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.fromLTRB(20, 140, 20, 0),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'vegetablelist');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Vegetables',
                        style: TextStyle(
                            fontSize: 22,
                            backgroundColor: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/RetailerHomePageButton/vegetables.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'fruitlist');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Fruits',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/RetailerHomePageButton/fruits.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'grainlist');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Grains',
                        style: TextStyle(
                            fontSize: 26,
                            backgroundColor: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/RetailerHomePageButton/grains.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'flowerlist');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Flowers',
                        style: TextStyle(
                            fontSize: 26,
                            backgroundColor: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/RetailerHomePageButton/flowers.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            )));
  }
}
