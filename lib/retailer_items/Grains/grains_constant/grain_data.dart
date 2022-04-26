//import 'package:flutter/material.dart';

List menus = ["Choose the Grain"];

List items = [
  {
    "id": 1,
    "product": "YardLongBean",
    "productdetail":
        " YardLongBean\n Contains: \n Vitamin C	31%,\n Calcium	5%,\n Iron 2%,\n	Vitamin D	0%,\n Vitamin B6 0%,\n Cobalamin	0%,\n Magnesium	11%",
    "img": "assets/RetailerGrains/YardLongBean.png",
    "p_price": 80.00,
    "p_promotion_price": 55.00
  },
  {
    "id": 2,
    "product": "WingedBean",
    "productdetail":
        " WingedBean Contains: \n Vitamin C 0%,\n	Calcium	3%,\n Iron 11%,\n Vitamin D	0%,\n Vitamin B6	5%,\n	Cobalamin	0%,\n Magnesium	6%",
    "img": "assets/RetailerGrains/WingedBean.png",
    "p_price": 90.00,
    "p_promotion_price": 40.00
  },
  {
    "id": 3,
    "product": "SoyBean",
    "productdetail":
        " SoyBean Contains:\n Calories: 173,\n Fiber: 6g,\n Carbohydrates: 9.9g ,\n Protein: 16.6 g,\n Fat: 9g",
    "img": "assets/RetailerGrains/SoyBean.png",
    "p_price": 95.00,
    "p_promotion_price": 32.00
  },
  {
    "id": 4,
    "product": "PumpkinSeed",
    "productdetail":
        " PumpkinSeed\nContains: \n Fiber: 1.7g,\n Carbs: 5g,\n Protein: 7g,\n Fat: 13g,\n Vitamin K: 18% RDI,\n Phosphorus: 33% RDI,\n Manganese: 42% RDI,\n Magnesium: 37% RDI",
    "img": "assets/RetailerGrains/PumpkinSeed.png",
    "p_price": 69.00,
    "p_promotion_price": 30.00
  },
  {
    "id": 5,
    "product": "NavyBean",
    "productdetail":
        " NavyBean Contains:\n Calories: 255,\n Protein: 15.0g,\n Fiber: 19.1g,\n Vitamin B9: 64% RDI,\n manganese: 48% RDI,\n Vitamin B1: 29% RDI,\n Magnesium: 24% RDI,\n Iron: 24% RDI",
    "img": "assets/RetailerGrains/NavyBean.png",
    "p_price": 89.00,
    "p_promotion_price": 50.00
  },
  {
    "id": 6,
    "product": "MungBean",
    "productdetail":
        " MungBean Contains:\n Calories: 212,\n Fat: 0.8g,\n Protein: 14.2g,\n Carbs: 38.7g,\n Fiber: 15.4g,\n Folate B9: 80%,\n Manganese: 30% RDI,\n Magnesium: 24% RDI",
    "img": "assets/RetailerGrains/MungBean.png",
    "p_price": 70.00,
    "p_promotion_price": 39.00
  },
  {
    "id": 7,
    "product": "LupinBean",
    "productdetail":
        " LupinBean Contains:\n Vitamin C	8%,\n Calcium	17%,\n Iron	24%,\n Vitamin D 0%,\n Vitamin B6 20%,\n Cobalamin 0%,\n Magnesium	49%",
    "img": "assets/RetailerGrains/LupinBean.png",
    "p_price": 88.00,
    "p_promotion_price": 40.00
  },
  {
    "id": 8,
    "product": "LimaBean",
    "productdetail":
        " LimaBean Contains:\n Calories: 209,\n Protein: 12g,\n Fat: 0.5g,\n Carbs: 40g,\n Fiber: 9g,\n Manganese: 92%,\n Copper: 58% DV,\n Magnesium: 30% DV",
    "img": "assets/RetailerGrains/LimaBean.png",
    "p_price": 75.00,
    "p_promotion_price": 30.00
  },
  {
    "id": 9,
    "product": "KidneyBean",
    "productdetail":
        " KidneyBean Contains:\n Calories: 127,\n Water: 67%,\n Protein: 8.7g,\n Carbs: 22.8g,\n Sugar: 0.3g,\n Fiber: 6.4g,\n Fat: 0.5g",
    "img": "assets/RetailerGrains/KidneyBean.png",
    "p_price": 99.00,
    "p_promotion_price": 45.00
  },
  {
    "id": 10,
    "product": "GreenBean",
    "productdetail":
        " GreenBean Contains:\n 28 calories,\n 0.55g fat,\n 5.66g carbohydrate,\n 2.6g fiber,\n 1.94g sugar,\n 1.42g protein.",
    "img": "assets/RetailerGrains/GreenBean.png",
    "p_price": 85.00,
    "p_promotion_price": 38.00
  },
  {
    "id": 11,
    "product": "CranberryBean",
    "productdetail":
        " CranberryBean\n Contains:\n Calories: 136,\n Fat: 0.5g,\n Sodium: 1mg,\n Carbohydrates: 24.5,\n Fiber: 8.6g,\n Sugars: 0g,\n Protein: 9.3g",
    "img": "assets/RetailerGrains/cranberryBean.png",
    "p_price": 100.00,
    "p_promotion_price": 75.00
  },
  {
    "id": 12,
    "product": "BroadBean",
    "productdetail":
        " BroadBean Contains:\n Vitamin C	6%,\n Calcium	3%,\n Iron	8%,\n	Vitamin D	0%,\n Vitamin B6	5%,\n	Cobalamin	0%,\n Magnesium	8%",
    "img": "assets/RetailerGrains/BroadBean.png",
    "p_price": 80.00,
    "p_promotion_price": 45.00
  },
  {
    "id": 13,
    "product": "BlackTurtleBean",
    "productdetail":
        " BlackTurtleBean\n Contains:\n Protein: 7.62g,\n Fat: 0.46g,\n Carbohydrate: 20.39g,\n Fiber: 7.5g,\n Sugars: 0.28g,\n Calcium: 23mg,\n Iron: 1.81mg",
    "img": "assets/RetailerGrains/blackTurtleBean.png",
    "p_price": 92.00,
    "p_promotion_price": 50.00
  },
  {
    "id": 14,
    "product": "BakedBean",
    "productdetail":
        " BakedBean Conains:\n Calories: 119,\n Total fat: 0.5g,\n Total carbs: 27g,\n Fiber: 5g,\n Protein: 6g,\n Sodium: 19%,\n Potassium: 6% RDI,\n Iron: 8% RDI",
    "img": "assets/RetailerGrains/BakedBean.png",
    "p_price": 100.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 15,
    "product": "AdzukiBean",
    "productdetail":
        " AdzukiBean Contains:\n 128 calories,\n 7.5g protein,\n 0 gm fats,\n 0gm cholesterol,\n 25gm carbohydrates,\n 7.3gm fiber,\n 28mg calcium,\n 52mg magnesium",
    "img": "assets/RetailerGrains/AdzukiBean.png",
    "p_price": 70.00,
    "p_promotion_price": 35.00
  },
];
