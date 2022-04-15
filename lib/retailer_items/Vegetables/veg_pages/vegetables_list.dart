import 'package:flutter/material.dart';
import 'package:firstproject/retailer_items/Vegetables/veg_constant/veg_data.dart';
import 'package:firstproject/retailer_items/Vegetables/veg_pages/vegetable_description.dart';
import 'package:firstproject/retailer_items/Vegetables/veg_theme/veg_colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:like_button/like_button.dart';

class VegList extends StatefulWidget {
  const VegList({Key? key}) : super(key: key);
  @override
  _VegListState createState() => _VegListState();
}

class _VegListState extends State<VegList> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Vegetables",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlueAccent),
              ),
              Row(
                children: const <Widget>[
                  Icon(
                    LineIcons.search,
                    size: 28,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    menus.length,
                    (index) => InkWell(
                          onTap: () {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: activeIndex == index
                                      ? primary
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: activeIndex == index
                                          ? Colors.transparent
                                          : primary),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  menus[index],
                                  style: TextStyle(
                                      color: activeIndex == index
                                          ? white
                                          : primary,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ))),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: List.generate(
                items.length,
                (index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VegetableDescription(
                                      id: items[index]['id'],
                                      product: items[index]['product'],
                                      img: items[index]['img'],
                                      productdetail: items[index]
                                          ['productdetail'],
                                      pPrice:
                                          items[index]['p_price'].toString(),
                                      pPromotionPrice: items[index]
                                              ['p_promotion_price']
                                          .toString(),
                                    )));
                      },
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Hero(
                              tag: items[index]['id'].toString(),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(items[index]['img']),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  items[index]['product'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      " ₹ " +
                                          items[index]['p_promotion_price']
                                              .toString() +
                                          " / Kg",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      " ₹ " +
                                          items[index]['p_price'].toString() +
                                          "/ Kg",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: warning,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const LikeButton(
                                      size: 25,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
