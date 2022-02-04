import 'package:flutter/material.dart';

class FarmerHomePage extends StatelessWidget {
  const FarmerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.grey[300],
            body: GridView.count(
              crossAxisCount: 1,
              padding: const EdgeInsets.fromLTRB(20, 140, 20, 0),
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'FarmerCreatingVegetable');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'VEGETABLES',
                        style: TextStyle(
                            fontSize: 26,
                            backgroundColor: Colors.black,
                            color: Colors.white
                            //fontWeight: FontWeight.bold
                            ),
                      ),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/FarmerHomePageButton/FarmerVegetable.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'FarmerCreatingFruit');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'FRUITS',
                        style: TextStyle(
                            fontSize: 26,
                            backgroundColor: Colors.black,
                            color: Colors.white),
                      ),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/FarmerHomePageButton/FarmerFruit.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'FarmerCreatingGrain');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'GRAINS',
                        style: TextStyle(
                            fontSize: 26,
                            backgroundColor: Colors.black,
                            color: Colors.white),
                      ),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/FarmerHomePageButton/FarmerGrain.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'FarmerCreatingFlower');
                  },
                  child: Container(
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'FLOWERS',
                        style: TextStyle(
                            fontSize: 26,
                            backgroundColor: Colors.black,
                            color: Colors.white),
                      ),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/FarmerHomePageButton/FarmerFlower.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            )));
  }
}
