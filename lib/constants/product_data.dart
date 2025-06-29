import 'package:flutter/material.dart';
import 'package:provider_data_transfer/utils/app_assets.dart';
import 'package:provider_data_transfer/utils/app_strings.dart';

class ProductData{
  static final Map<String,dynamic> drinkProducts={
     "totalCount": 7,
     "type":"drink",
    "products":[
      {
      "title":"one Modelo Especial",
      "description":"Size 35.5 cl / 355ml",
      "price":3.55,
      "image":AppAssets.productImage1

    },
    {
      "title":"two Bai Coconut Flavored",
      "description":"Size 25.5 cl / 355ml",
      "price":5.55,
      "image":AppAssets.productImage2

    },
     {
      "title":"three Modelo Especial three ",
      "description":"Size 35.5 cl / 355ml",
      "price":3.55,
      "image":AppAssets.productImage1

    },
    {
      "title":"four Bai Coconut Flavored four",
      "description":"Size 25.5 cl / 355ml",
      "price":5.55,
      "image":AppAssets.productImage2

    },
     {
      "title":"five Modelo Especial",
      "description":"Size 35.5 cl / 355ml",
      "price":3.55,
      "image":AppAssets.productImage1

    },
    {
      "title":"six Bai Coconut Flavored",
      "description":"Size 25.5 cl / 355ml",
      "price":5.55,
      "image":AppAssets.productImage2

    },
    {
      "title":"seven neuroSLEEP Mango",
      "description":"Size 15.5 cl / 355ml",
      "price":1.225,
      "image":AppAssets.productImage3

    },
    
    ]
  };
static final Map<String, dynamic> foodProducts = {
  "totalCount": 3,
  "type":"food",
  "products":[
           {
      "title":"Biryani",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":5,
      "image":AppAssets.foodImage1,
      

    },
    {
      "title":"Mix Vegitable Sabzi",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":3.55,
      "image":AppAssets.foodImage2,
      

    },
    {
      "title":"Alo Palak Sabzi",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":20.9,
      "image":AppAssets.foodImage3,
      

    },
    
  ]
};
static final Map<String, dynamic> gameProducts = {
  "totalCount": 3,
  "type":"game",
  "products":[
           {
      "title":"Biryani",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":5,
      "image":AppAssets.foodImage1,
      

    },
    {
      "title":"Mix Vegitable Sabzi",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":3.55,
      "image":AppAssets.foodImage2,
      

    },
    {
      "title":"Alo Palak Sabzi",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":20.9,
      "image":AppAssets.foodImage3,
      

    },
    
  ]
};

static final Map<String, dynamic> healthProducts = {
  "totalCount": 3,
  "type":"health",
  "products":[
           {
      "title":"Biryani",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":5,
      "image":AppAssets.foodImage1,
      

    },
    {
      "title":"Mix Vegitable Sabzi",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":3.55,
      "image":AppAssets.foodImage2,
      

    },
    {
      "title":"Alo Palak Sabzi",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio, pretium at magna non, tincidunt congue risus. Suspendisse potenti. Donec sit amet felis ut sapien cursus volutpat.",
      "price":20.9,
      "image":AppAssets.foodImage3,
      

    },
    
  ]
};
//  static final List<Map<String,dynamic>> foodProducts=[
//     {
//       "title":"FooodModelo Especial",
//       "description":"Size 35.5 cl / 355ml",
//       "price":3.55,
//       "image":AppAssets.productImage1,
      

//     },
//     {
//       "title":"foood Bai Coconut Flavored",
//       "description":"Size 25.5 cl / 355ml",
//       "price":5.55,
//       "image":AppAssets.productImage2

//     },
//     {
//       "title":"food neuroSLEEP Mango",
//       "description":"Size 15.5 cl / 355ml",
//       "price":1.225,
//       "image":AppAssets.productImage3

//     },
//     {
//       "title":"Surely Non Alcoholic",
//       "description":"Size 95.5 cl / 355ml",
//       "price":1.55,
//       "image":AppAssets.productImage4

//     },
    
//   ];

  static final List<Map<String,dynamic>> choiceList=[
    {
      'title':AppStrings.drink,
      'icon':Icons.local_drink_sharp
    },
     {
      'title':AppStrings.food,
      'icon':Icons.food_bank
    },
     {
      'title':AppStrings.health,
      'icon':Icons.health_and_safety
    },
     {
      'title':AppStrings.gaming,
      'icon':Icons.games
    }
  ];
}