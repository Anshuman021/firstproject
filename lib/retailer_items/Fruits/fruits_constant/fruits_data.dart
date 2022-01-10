//import 'package:flutter/material.dart';

List menus = ["Choose the vegetable"];

List items = [
  {
    "id": 1,
    "product": "Tomato (टमाटर)",
    "productdetail":
        " Tomato Contains: \n Calories: 18,\n Protein: 0.9 grams,\n Sugar: 2.6 grams, \n Fiber: 1.2 grams",
    "img": "assets/vegetables/tomato.jpg",
    "p_price": 80.00,
    "p_promotion_price": 55.00
  },
  {
    "id": 2,
    "product": "Onion (प्याज)",
    "productdetail":
        " Onion Contains: \n vitamin C, \n vitamin B6, \n potassium, \n folate,\n and manganese.",
    "img": "assets/vegetables/onion.jpg",
    "p_price": 90.00,
    "p_promotion_price": 40.00
  },
  {
    "id": 3,
    "product": "Potato (आलू)",
    "productdetail":
        " Potato Contains:\n Calories: 87, \n Protein: 1.9 grams, \n Sugar: 0.9 grams, \n Fiber: 1.8 grams",
    "img": "assets/vegetables/potato.jpg",
    "p_price": 100.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 4,
    "product": "Spinach (पालक)",
    "productdetail":
        " Spinach Contains: \n Calories: 23,\n Protein: 2.9 grams, \n Sugar: 0.4 grams, \n Fiber: 2.2 grams",
    "img": "assets/vegetables/Spinach.jpg",
    "p_price": 120.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 5,
    "product": "Pumpkin (कद्दू)",
    "productdetail":
        " Pumpkin Contains:\n Calories: 137,\n Protein: 3 grams,\n Fat: 7 grams, \n Fiber: 7 grams, \n Vitamin A",
    "img": "assets/vegetables/pumpkin.jpg",
    "p_price": 100.00,
    "p_promotion_price": 50.00
  },
  {
    "id": 6,
    "product": "Radish (मूली)",
    "productdetail":
        " Radish Contains:\n Calories: 9,\n Protein: 0 grams,\n Fat: 1 gram,\n Fiber: 1 gram,\n Sugar: 1 gram",
    "img": "assets/vegetables/radish.jpg",
    "p_price": 120.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 7,
    "product": "Lady Finger (भिन्डी )",
    "productdetail":
        " LadyFinger Contains:\n Calories: 33, \n Carbs: 7 grams,\n Protein: 2 grams, \n Fat: 0 grams, \n Fiber: 3 grams, \n Vitamin A",
    "img": "assets/vegetables/lady-finger.jpg",
    "p_price": 100.00,
    "p_promotion_price": 40.00
  },
  {
    "id": 8,
    "product": "Red Chilli (लाल मिर्च)",
    "productdetail":
        " RedChilli Contains:\n Calories: 6,\n Water: 88%,\n Protein: 0.3 grams,\n Carbs: 1.3 grams,\n Sugar: 0.8 grams,\n Fiber: 0.2 grams",
    "img": "assets/vegetables/Red-Chilli.jpg",
    "p_price": 120.00,
    "p_promotion_price": 70.00
  },
  {
    "id": 9,
    "product": "Peas (मटर)",
    "productdetail":
        " Peas Contains:\n Calories: 62,\n Carbs: 11 grams,\n Fiber: 4 grams,\n Protein: 4 grams,\n Vitamin A: 34%",
    "img": "assets/vegetables/Peas.jpg",
    "p_price": 130.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 10,
    "product": "Cucumber (खीरा)",
    "productdetail":
        " Cucumber Contains:\n Calories: 30,\n Total fat: 0 grams,\n Protein: 3 grams,\n Fiber: 2 grams,\n Vitamin C: 10%",
    "img": "assets/vegetables/Cucumber.jpg",
    "p_price": 100.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 11,
    "product": "Cabbage (पत्ता गोभी)",
    "productdetail":
        " Cabbage Contains:\n Calories: 22,\n Protein: 1 gram,\n Fiber: 2 grams,\n Vitamin K: 85%(RDI),\n Vitamin C: 54%",
    "img": "assets/vegetables/cabbage.jpg",
    "p_price": 100.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 12,
    "product": "Beetroot (चकुंदर)",
    "productdetail":
        " Beetroot Contains:\n Calories: 43,\n Water: 88%,\n Protein: 1.6 grams,\n Carbs: 9.6 grams,\n Sugar: 6.8 grams,\n Fiber: 2.8 grams",
    "img": "assets/vegetables/Beetroot.jpg",
    "p_price": 100.00,
    "p_promotion_price": 50.00
  },
  {
    "id": 13,
    "product": "Corn (मक्का)",
    "productdetail":
        " Corn Contains:\n Calories: 90,\n Protein: 3 grams (g),\n Fat: 1 g,\n Carbohydrates: 19 g,\n Fiber: 1 g",
    "img": "assets/vegetables/Corn.jpg",
    "p_price": 90.00,
    "p_promotion_price": 45.00
  },
  {
    "id": 14,
    "product": "Carrot (गाजर)",
    "productdetail":
        " Carrots Conains:\n Calories: 41,\n Water: 88%,\n Protein: 0.9 grams,\n Carbs: 9.6 grams,\n Sugar: 4.7 grams,\n Fiber: 2.8 grams",
    "img": "assets/vegetables/Carrot.jpg",
    "p_price": 120.00,
    "p_promotion_price": 60.00
  },
  {
    "id": 15,
    "product": "Brinjal (बैगन)",
    "productdetail":
        " Brinjal Contains:\n Calories: 20,\n Carbs: 5 grams,\n Fiber: 3 grams,\n Protein: 1 gram,\n Manganese: 10%,\n Folate: 5%,\n Potassium: 5%",
    "img": "assets/vegetables/Brinjal.jpg",
    "p_price": 90.00,
    "p_promotion_price": 35.00
  },
];
